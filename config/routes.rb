Rails101Groupme::Application.routes.draw do
  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }
  root :to => 'high_voltage/pages#show', :id => 'welcome'

	resources :groups do
		resources :posts
	end
end
