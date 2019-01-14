class GenresController < ApplicationController

  def index
    @genres = Genre.all
  end

  def show
    set_genre
  end

  def new
    @genre = Genre.new(params[:genre])
  end

  def create
    genre = Genre.create({name: params[:genre][:name]})

    redirect_to genre_path(genre)
  end

  def edit
    set_genre
  end

  def update
    set_genre
    @genre.update(params.require(:genre).permit(:name))

    redirect_to genre_path(@genre)
  end

  private

  def set_genre
    @genre = Genre.find(params[:id])
  end

end
