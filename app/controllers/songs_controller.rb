class SongsController < ApplicationController

  def index
    @songs = Song.all
  end

  def show
    set_song
    @genre = @song.genre
    @artist = @song.artist
  end

  def new
    @song = Song.new(params[:song])
  end

  def create
    song = Song.create(params.require(:song).permit(:name, :artist_id, :genre_id))

    redirect_to song_path(song)
  end

  def edit
    set_song
  end

  def update
    set_song
    @song.update(params.require(:song).permit(:name, :artist_id, :genre_id))

    redirect_to song_path(@song)
  end

  private

  def set_song
    @song = Song.find(params[:id])
  end

end
