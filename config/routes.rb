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
  resources :notifications
  #resources :notifications do
    #member do
    #  patch :accepted
    #  patch :rejected
    #end
  #end
  get "todo_lists/:id/share", to: "todo_lists#share", as: :share_todo_list_get
  post "todo_lists/:id/share", to: "todo_lists#share", as: :share_todo_list_post
  patch "notifications/:id/accept", to: "notifications#accepted", as: :notifications_accept
  patch "notifications/:id/reject", to: "notifications#rejected", as: :notifications_reject
  root "todo_lists#index"

end