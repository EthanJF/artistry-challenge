class ArtistInstrumentsController < ApplicationController

    def new
        @artist_instrument = ArtistInstrument.new
    end

    def create
        @artist_instrument = ArtistInstrument.new(artist_instruments_params)
      
        if @artist_instrument.save
            @artist = Artist.find(artist_instruments_params[:artist_id])
            redirect_to @artist
        else 
            flash[:errors] = @artist_instrument.errors.full_messages
            redirect_to new_artist_instrument_path
        end
    end

    private

    def artist_instruments_params
        params.require(:artist_instrument).permit(:artist_id, :instrument_id)
    end
   
end
