class CreateTodos < ActiveRecord::Migration[4.2]
  def change
    create_table :todos do |t|
      t.string :title
      t.integer :user_id
      t.timestamp null: false
    end
  end
end
