Rails.application.routes.draw do

  devise_for :users

  resources :answer_sets

  resources :health_plans

  root to: 'main#index'

  get "main/questions_1" => "main#questions_1"

  get "main/questions_2" => "main#questions_2"

  get "main/recommendations" => "main#recommendations"

  #controller :main do
  #post '/post_answers1', to: 'post_answers1', as: 'post_answers'
  #post '/post_answers1', to: 'post_answers1', as: 'answers_index'
  #end

end
