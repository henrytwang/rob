class GamesController < ApplicationController
    def index
    end

    def create
      @user = User.find_or_create_by_name(params[:game][:text])
      session[:current_user_id] = @user.id
      @game = Game.create(:user_id => @user.id)
      session[:current_game_id] = @game.id

      @user.games << @game

      sound_ids = (1..10).to_a
      10.times do
        sound = Sound.create(:filename => sound_ids.pop.to_s, :mammal_type => "rapper")
        turn = Turn.create
        turn.sound = sound
        @game.turns << turn
      end

      redirect_to game_path(@game)
    end

    def show
      @twitter_accounts = [
      # Rappers
      "@birdman5star",
      "@snoopdogg",
      "@therealbigboi",
      "@50cent",
      "@kanyewest",
      "@iamdiddy",
      "@revrunwisdom",
      "@nickiminaj",
      "@gucci1017",
      "@bowwow",
      "@thejuelzsantana",
      "@thegame",
      "@myfabolouslife",
      # Bird organizations
      "@wbsstl",
      # Bird... related
      "@angrybirds"]
      @game = Game.find(session[:current_game_id])
      @game.score = @game.turns.where("guess" => true).count
      @game.save
      @top_score = 0
      Game.all.each do |game|
        @top_score = game.score if game.score > @top_score
      end
      @top_users = Game.where(:score => @top_score).map {|game| game.user}
      @tweet = "I got #{@game.turns.where("guess" => true).count} out of 10. Your move, #{@twitter_accounts.sample}"
    end
end