Sleepdata::Application.routes.draw do

  resources :holidays
  resources :processed_data
  resources :raw_data

end
