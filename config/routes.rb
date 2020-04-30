Rails.application.routes.draw do
  devise_for :users, :controllers => { registrations: 'registrations' }
  resources :todo_lists do
    resources :todo_items do
      member do
        patch :complete
        patch :uncomplete
      end
    end
  end
  get "todo_lists/:id/share", to: "todo_lists#share", as: :share_todo_list
  
  root "todo_lists#index"

end