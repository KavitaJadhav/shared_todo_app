SharedTodoApp::Application.routes.draw do

  match "todos/index" => "todos#index", :as => :index, via: [:get, :post]
  match "todos/add" => "todos#add", :via => :post
  match 'todos/perform' => 'todos#perform', :via => :post

end
