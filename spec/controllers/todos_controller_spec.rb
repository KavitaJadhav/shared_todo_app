require 'spec_helper'

describe TodosController do

  describe 'add' do
    it 'should add todo item in todolist with valid values' do
      todos_before_add = Todo.count

      post :add, todo: {todo_item: "do something"}

      todo = Todo.last
      expect(Todo.count).to eq todos_before_add+1
      expect(todo.todo_item).to eq "do something"
      expect(flash[:success]).to eq "do something task added successfully"
      response.response_code.should == 302
    end

    it 'should not add todo item in todolist with invalid values' do
      todos_before_add = Todo.count

      post :add, todo: {todo_item: nil}

      expect(Todo.count).to eq todos_before_add
      expect(flash[:error]).to eq "Todo item can't be blank"
    end
  end

  describe "perform" do
    it 'should delete todo item' do

      todo1 = Todo.create(:todo_item => "todo1" )
      todo2 = Todo.create(:todo_item => "todo2" )
      todos_before_delete = Todo.count
      params[:commit] = "Delete"
      params[:todos_checkbox] =[todo2.id]

      post :perform

    end
  end
end
