Rails.application.routes.draw do
  resources :task_lists do
    resources :tasks
  end
  devise_for :users
  get "welcome/index"
  # Definindo a rota raiz para a página inicial
  root 'welcome#index'


end
