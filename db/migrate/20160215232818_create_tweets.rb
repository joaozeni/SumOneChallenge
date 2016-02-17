class CreateTweets < ActiveRecord::Migration
  def change
    create_table :tweets do |t|
      t.string :user

      t.timestamps null: false
    end

    create_table :text do |t|
        t.belongs_to :tweet, index:true
        t.text :text

        t.timestamps null: false
    end
    add_index :tweets, :user, unique: true
  end
end
