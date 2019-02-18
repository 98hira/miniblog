class MiniblogController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]

  def index
    @posts = Tweet.includes(:user)
  end

  def new
  end

  def create
    tweet = tweet_params.merge(user_id: current_user.id)
    success_flag = Tweet.create(tweet).valid?
    @status = success_flag ? "成功": "失敗"
  end

  def edit
    @tweet = Tweet.find(params[:id])
  end

  def update
    success_flag = Tweet.find(params[:id]).update(tweet_params)
    @status = success_flag ? "成功": "失敗"
  end

  def show
    @tweet = Tweet.find(params[:id])
  end

  def destroy
    success_flag = Tweet.find(params[:id]).destroy
    @status = success_flag ? "成功": "失敗"
  end

  private
  def tweet_params
   params.permit(:text)
 end

end
