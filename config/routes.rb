Rails.application.routes.draw do
  get 'quizes/index'
  root to: "quizes#index"
  devise_for :users
end
