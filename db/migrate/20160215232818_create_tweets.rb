class CreateTweets < ActiveRecord::Migration
  def change
    create_table :tweets do |t|
      t.string :user

      t.timestamps null: false
    end
    add_index :tweets, :user, unique: true
  end
end
