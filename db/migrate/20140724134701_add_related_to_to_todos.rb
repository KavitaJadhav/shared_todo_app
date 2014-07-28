class AddRelatedToToTodos < ActiveRecord::Migration
  def change
    add_column :todos, :related_to, :string
  end
end
