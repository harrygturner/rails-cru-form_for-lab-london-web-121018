class ArtistsController < ApplicationController

  def index
    @artists = Artist.all
  end

  def show
    set_artist
  end

  def new
    @artist = Artist.new(params[:artist])
  end

  def create
    artist = Artist.create({name: params[:artist][:name], bio: params[:artist][:bio]})

    redirect_to artist_path(artist)
  end

  def edit
    set_artist
  end

  def update
    set_artist
    @artist.update(params.require(:artist).permit(:name, :bio))

    redirect_to artist_path(@artist)
  end

  private

  def set_artist
    @artist = Artist.find(params[:id])
  end

end
