Rails.application.routes.draw do

  devise_for :users

  root to: 'main#index'

  get "main/questions_1" => "main#questions_1"

  get "main/questions_2" => "main#questions_2"

  get "main/recommendations" => "main#recommendations"

end
