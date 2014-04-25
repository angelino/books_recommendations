BooksRecommendations::Application.routes.draw do
  get 'books' => 'books#index'
  get 'books/:id' => 'books#show', :as => 'book'

  get 'users' => 'users#index'
  get 'users/:id' => 'users#show', :as => 'user'

  #get "rank/:user_id" => 'rank#show', :as => 'rank'
  #get "recommendations/:user_id" => 'recommendations#show', :as => 'recommendation'
end
