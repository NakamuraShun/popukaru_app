Rails.application.routes.draw do
	# フロント
	scope module: 'front' do
		root 'home#index'
		get "/about",    to: "pages#about"
		resources :articles,          only: [:index, :show]
		resources :editors,           only: [:show]
		resources :notices,           only: [:index, :show]
		resources :contacts,          only: [:index, :create]
	end

	# 管理画面
	namespace :admin do
		root 'home#index'
		resources :articles,          only: [:index, :new, :create, :edit, :update, :destroy]
		resources :categories,        only: [:index, :create, :update, :destroy]
		resources :tags,              only: [:index, :create, :update, :destroy]
		resources :sliders,           only: [:index, :create]
		resources :pickup_articles,   only: [:index, :create]
		resources :editors,           only: [:index, :new, :create, :edit, :update, :destroy]
		resources :notices,           only: [:index, :new, :create, :edit, :update, :destroy]
		resources :contacts,          only: [:index, :show]
	end

end
