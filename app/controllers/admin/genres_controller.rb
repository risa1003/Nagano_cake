class Admin::GenresController < ApplicationController
  def index
    @genre = Genre.new
    @genres = Genre.all
  end

  def edit
    @genre = Genre.find(params[:id])
  end

  def create
    @genre = Genre.new(genre_params)
    @genre.save
  end

  def update
    @genre = Genre.find(params[:id])
  end
end

private

def genre_params
  params.require(:genre).permit(:name)
end