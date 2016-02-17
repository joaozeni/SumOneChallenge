class CreateTexts < ActiveRecord::Migration
  def change
    create_table :texts do |t|
      t.belongs_to :tweet, index: true
      t.text :text

      t.timestamps null: false
    end
    
    #create_table :tweets do |t|
    #    t.string :user

    #    t.timestamps null: false
    #end
  end
end
