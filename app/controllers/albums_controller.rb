class AlbumsController < ApplicationController

  # Require an authenticated user
  before_filter :authenticate_user!


  def index
    user = User.find params[:user_id]

    render locals: { user: user }
  end


  def new
    user = User.find params[:user_id]

    render locals: { user: user }
  end


  def create
    @album = Album.new params[:album]

    if @album.valid? && @album.save
      redirect_to albums_url @album.user
    else
      render action: :new
    end
  end


  def view
    album = Album.find params[:album_id]

    render locals: { album: album }
  end

end
