Rails.application.routes.draw do
  devise_for :users
  root 'miniblog#index'  #ルートパスの指定
  get 'miniblog' => "miniblog#index"
end
