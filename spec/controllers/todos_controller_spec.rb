require 'spec_helper'

describe TodosController do

  describe 'add' do
    it 'should add todo item in todolist with valid values' do
      todos_before_add = Todo.count

      post :add, todo:{todo_item:"do something" }

      todo = Todo.last
      expect(Todo.count).to eq todos_before_add+1
      expect(todo.todo_item).to eq "do something"
      expect(flash[:success]).to eq "do something task added successfully"
      response.response_code.should == 302
    end

    it 'should not add todo item in todolist with invalid values' do
      todos_before_add = Todo.count

      post :add, todo:{todo_item:nil }

      expect(Todo.count).to eq todos_before_add
      expect(flash[:error]).to eq "Todo item can't be blank"
    end
  end
end







#describe 'create_income' do
#
#  it 'should create an income with valid values' do
#    income_count_before_post_request = Income.count
#    post :create_income, income: {source: "salary", amount: 100}
#
#    income = Income.last
#
#    response.response_code.should == 302
#    expect(Income.count).to eq income_count_before_post_request+1
#    expect(income.source).to eq "salary"
#    expect(income.amount).to eq 100
#    expect(flash[:success]).to eq "salary added to Incomes successfully"
#  end
#
#
#  it 'should not create an income with invalid values' do
#    income_count_before_post_request = Income.count
#    post :create_income, income: {source: nil, amount: nil}
#    expect(Income.count).to eq income_count_before_post_request
#    expect(flash[:error]).to eq "Source can't be blank<br>Amount can't be blank"
#  end
#
#end
#
#describe 'add_income' do
#  it 'should redirect to add income page' do
#    get :add_income
#    response.response_code.should == 200
#  end
#end
