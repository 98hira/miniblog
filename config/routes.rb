Rails.application.routes.draw do
  root 'miniblog#index'  #ルートパスの指定
  get 'miniblog' => "miniblog#index"
end
