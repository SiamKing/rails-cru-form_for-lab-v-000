class ArtistsController < ApplicationController
    before_action :get_artist, only: [:show, :edit, :update]

    def index
        @artists = Artist.all
    end

    def show
    end

    def new
        @artist = Artist.new
    end

    def create
        @artist = Artist.new(artist_params)
        @artist.save
        redirect_to artist_path(@artist)
    end

    def edit
    end

    def update
        @artist.update(artist_params)
        @artist.save
        redirect_to artist_path(@artist)
    end

    private

    def artist_params
        params.require(:artist).permit(:name, :bio)
    end

    def get_artist
        @artist = Artist.find_by_id(params[:id])
    end
end
