class CreatePregunta < ActiveRecord::Migration
  def change
    create_table :pregunta do |t|
      t.string :content
      t.integer :user_id
      t.boolean :answered
      t.text :tags

      t.timestamps
    end
    add_index :pregunta, [:user_id, :created_at]
  end
end
