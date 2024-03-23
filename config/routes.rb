Rails.application.routes.draw do
	scope module: 'front' do
		root 'home#index'
		get "/about",    to: "pages#about"

		resources :articles, only: [:index, :show]
	end

end
