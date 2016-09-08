Rails.application.routes.draw do
  scope module: 'api' do
    namespace :v1 do
      post 'login' => 'users#login'
      post 'signup' => 'users#signup'
      get 'urls/:id/visits' => 'urls#visits'
      resources :urls
    end
  end
  get ':short_code' => 'api/v1/visits#redirect'
end
