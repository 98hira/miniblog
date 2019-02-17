class MiniblogController < ApplicationController
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
    @tweet = Tweet.find(params.permit[:id])
  end

  private
  def tweet_params
   params.permit(:text)
 end

end
