Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  root to: "items#index"
  resources :items do
  # only: [:index, :new, :create, :show, :edit, :update, :destroy] ７つのアクションを上記でまとめた

    resources :records, only: [:index, :create]
    # 購入記録を表示するためのアクションに対応するルーティング
  end
end
