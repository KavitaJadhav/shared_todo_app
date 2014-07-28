class TodosController < ApplicationController

  def index
    @todo_items = Todo.all.group_by(&:related_to)
    @new_todo = Todo.new
  end

  def add

    todo = Todo.create(:todo_item => params[:todo][:todo_item])
    unless todo.valid?
      flash[:error] = todo.errors.full_messages.join("<br>").html_safe
    else
      flash[:success] = "#{todo[:todo_item]} task added successfully"
    end
    redirect_to index_path
  end

  def delete params
    params[:todos_checkbox].each do |check|
      todo_id = check
      Todo.find_by_id(todo_id).delete
    end
    flash[:success] = "#{params[:todos_checkbox].count} task removed successfully"
    redirect_to index_path
  end

  def complete params
    params[:todos_checkbox].each do |check|
      todo_id = check
      t = Todo.find_by_id(todo_id)
      t.update_attribute(:completed, !t.completed)
    end
    flash[:success] = "#{params[:todos_checkbox].count} task toggled successfully"
    redirect_to index_path
  end

  def perform
    if params[:todos_checkbox]
      if params[:commit] == "Delete"
        delete params
      else
        complete params
      end
    else
      flash[:error] = "Please select atleast one task to #{params[:commit]}"
      redirect_to index_path
    end
  end
end
