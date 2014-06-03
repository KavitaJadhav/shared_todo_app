class TodosController < ApplicationController

  def index
    @todo_items = Todo.all
    @new_todo = Todo.new
  end

  def delete
    todo = Todo.last
    todo.delete
    flash[:success] = "'#{todo[:todo_item]}' task removed successfully"
    redirect_to index_path
  end

  def add
    todo = Todo.create(:todo_item => params[:todo][:todo_item])
    unless todo.valid?
      flash[:error] = todo.errors.full_messages.join("<br>").html_safe
    else
      flash[:success] = "Todo added successfully"
    end
    redirect_to index_path
  end

  def complete
    params[:todos_checkbox].each do |check|
      todo_id = check
      t = Todo.find_by_id(todo_id)
      t.update_attribute(:completed, !t.completed)
    end
    redirect_to index_path
  end
end
