class TurnsController < ApplicationController

    def update
        game = Game.find(session[:current_game_id])
        turn = game.turns.where("guess" => nil).first
        p params[:mammal_type]
        if params[:turn][:mammal_type] == turn.sound.mammal_type
            turn.guess = true
            turn.save
        else
            turn.guess = false
            turn.save
        end
        redirect_to game_path(game)
    end

end