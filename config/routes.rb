Rails.application.routes.draw do

  devise_for :users

  resources :answer_sets

  resources :health_plans

  root to: 'main#index'

  get "main/questions_1" => "main#questions_1"

  post "main/post_answers_1" => "main#post_answers_1"

  get "main/questions_2" => "main#questions_2"

  post "main/post_answers_2" => "main#post_answers_2"

  get "main/questions_3" => "main#questions_3"

  post "main/post_answers_3" => "main#post_answers_3"

  get "main/questions_4" => "main#questions_4"

  post "main/post_answers_4" => "main#post_answers_4"

  get "main/questions_5" => "main#questions_5"

  post "main/post_answers_5" => "main#post_answers_5"

  get "main/questions_6" => "main#questions_6"

  post "main/post_answers_6" => "main#post_answers_6"

  get "main/recommendations" => "main#recommendations"
end
