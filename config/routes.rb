Rails.application.routes.draw do
  get 'mypage/index'
  devise_for :users
  root 'miniblog#index'  #ルートパスの指定
  # get 'miniblog' => "miniblog#index"
  resources :miniblog
end
