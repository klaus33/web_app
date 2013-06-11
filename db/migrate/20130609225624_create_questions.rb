class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.string :content
      t.integer :user_id
      t.boolean :answered
      t.text :tags

      t.timestamps
    end
  end
end
