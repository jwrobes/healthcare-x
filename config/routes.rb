Rails.application.routes.draw do

root to: 'main#index'

get "main/questions_1" => "main#questions_1"


end
