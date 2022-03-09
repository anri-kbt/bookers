Rails.application.routes.draw do

  #get 'homes/top'=>'homes#top'これをルーティングメソッドで書き換え
  root to:'homes#top'
  resources:books
  #get 'books'=>'books#index'
  #get 'books:id'=>'books#show'as'book'
  #get 'books/:id/edit'=>'books#edit', as: 'edit_book'
  #delete 'book/:id' => 'books#destroy', as: 'destroy_book'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
