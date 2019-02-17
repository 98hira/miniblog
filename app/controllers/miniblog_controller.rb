class MiniblogController < ApplicationController
  def index
  end

  def new
  end

  def create
    tweet = tweet_params.merge(user_id: current_user.id)
    success_flag = Tweet.create(tweet).valid?
  end

  private
  def tweet_params
   params.permit(:text)
 end
end
