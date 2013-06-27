class CreateAnswers < ActiveRecord::Migration
  def change
    create_table :answers do |t|
      t.string :content
      t.integer :user_id
      t.integer :question_id
      t.boolean :correct
      t.integer :vote

      t.timestamps
    end
    add_index :answers, [:user_id, :created_at]
    add_index :answers, [:question_id, :created_at]
  end
end
