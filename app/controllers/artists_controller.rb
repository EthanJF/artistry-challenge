class ArtistsController < ApplicationController

    def index
        @artists = Artist.all
    end

    def new
        @artist = Artist.new
    end

    def create
        @artist = Artist.new(artist_params)
        if @artist.save
            redirect_to @artist
        else
            flash[:errors] = @artist.errors.full_messages
            redirect_to new_artist_path
        end
    end

    def show
        @artist = Artist.find(params[:id])
    end

    private

    def artist_params
        params.require(:artist).permit(:name, :title, :age)
    end
 
end
