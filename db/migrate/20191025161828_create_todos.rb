class CreateTodos < ActiveRecord::Migration[4.2]
  def change
    create_table :todos do |t|
      t.string :title
      t.integer :user_id
      t.timestamps null: false
    end
  end
end
