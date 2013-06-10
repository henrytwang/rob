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
      "@BIRDMAN5STAR",
      "@SnoopDogg",
      "@JoeBudden",
      "@Therealbigboi",
      "@Therealkiss",
      "@50CENT",
      "@LTLline",
      "@KanyeWest",
      "@IAMDIDDY",
      "@RevRunWisdom",
      "@NICKIMINAJ",
      "@gucci1017",
      "@FINALLEVEL",
      "@BOWWOW",
      "@RayJ",
      "@jimjonescapo",
      "@thejuelzsantana",
      "@thegame",
      "@myfabolouslife",
      # Bird organizations
      "@WBSSTL",
      # Bird... related
      "@AngryBirds"]
      @game = Game.find(session[:current_game_id])
      @game.score = @game.turns.where("guess" => true).count
      @game.save
      @top_score = 0
      Game.all.each do |game|
        @top_score = game.score if game.score > @top_score
      end
      @top_users = Game.where(:score => @top_score).map {|game| game.user}
      @tweet = "#{@game.turns.where("guess" => true).count} out of 10. Your move, #{@twitter_accounts.sample}"
    end
end