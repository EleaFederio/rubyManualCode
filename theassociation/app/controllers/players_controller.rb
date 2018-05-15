class PlayersController < ApplicationController
    
    def index
        @players = Player.all
    end

    def new
        @player = Player.new
    end

    def show
        @players = Player.find(params[:id])
    end

    def edit
        @player = Player.find(params[:id])
    end

    def update
        player = Player.find(params[:id])
    
        if player.update(player_params)
            redirect_to "/players"
        else
            flash[:errors] = player.errors.full_messages
            redirect_to player_edit_path(players.id)
            # redirect_to "/players/#{player.id}/edit"
        end
    end

    def destroy
        player = Player.find(params[:id])
        player.destroy
        redirect_to :root
    end

    def create

        # player = Player.new
        # player.first_name = params[:player][:first_name]
        # player.last_name = params[:player][:last_name]
        
        player = Player.new(player_params)

        if player.save 
            redirect_to :root
        else
            flash[:errors] = player.errors.full_messages
            redirect_to "/players/new"
        end
    end

    private def player_params
        params.require(:player).permit(:first_name, :last_name)
    end

end
