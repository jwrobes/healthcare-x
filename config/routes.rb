Rails.application.routes.draw do

devise_for :users

root to: 'main#index'

get "main/questions_1" => "main#questions_1"


end
