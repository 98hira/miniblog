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
    redirect_to(action:"index") unless current_user.id == @tweet.user_id
  end

  def update
    tweet = Tweet.find(params[:id])
    if current_user.id == tweet.user_id
      success_flag = tweet.update(tweet_params)
      @status = success_flag ? "成功": "失敗"
    else
      redirect_to action:"index"
    end
  end

  def show
    @tweet = Tweet.find(params[:id])
  end

  def destroy
    tweet = Tweet.find(params[:id])
    if current_user.id == tweet.user_id
      success_flag = tweet.destroy
      @status = success_flag ? "成功": "失敗"
    else
      redirect_to action:"index"
    end
  end

  private
  def tweet_params
    params.permit(:text)
  end


end
