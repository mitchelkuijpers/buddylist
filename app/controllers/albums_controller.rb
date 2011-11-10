class AlbumsController < ApplicationController

  # Require an authenticated user
  before_filter :authenticate_user!


  def index
    user = User.find params[:user_id]

    authorize! :view_albumss, user

    render locals: { user: user }
  end


  def new
    user = User.find params[:user_id]

    authorize! :create_albums, user

    render locals: { user: user }
  end


  def create
    @album = Album.new params[:album]

    authorize! :create_albums, @album.user

    if @album.valid? && @album.save
      redirect_to albums_url @album.created_by
    else
      render action: :new, locals: { user: @album.user}
    end
  end


  def view
    album = Album.find params[:album_id]

    authorize! :view, album

    render locals: { album: album }
  end


  # Delete an album and all its contents
  #
  def destroy
    album = Album.find params[:album_id]

    authorize! :destroy, album

    album.destroy

    redirect_to user_url album.created_by
  end


end
