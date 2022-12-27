class ToppagesController < ApplicationController
  def index
    if logged_in?
      redirect_to memos_url
    end
  end
end
