Rails.application.routes.draw do

  devise_for :users

  resources :answer_sets

  resources :health_plans

  root to: 'main#index'

  get "main/questions_1" => "main#questions_1"

  post "main/post_answers_1" => "main#post_answers_1"

  get "main/questions_2" => "main#questions_2"

  post "main/post_answers_2" => "main#post_answers_2"

  get "main/recommendations" => "main#recommendations"
end
