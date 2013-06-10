class HomeController < ApplicationController
  def play
    @game = Game.find_by_user_id(session[:current_user_id])
  end
end
