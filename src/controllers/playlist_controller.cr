class PlaylistController < ApplicationController
  def index
    playlists = Playlist.all
    render("index.slang")
  end

  def show
    if playlist = Playlist.find params["id"]
      render("show.slang")
    else
      flash["warning"] = "Playlist with ID #{params["id"]} Not Found"
      redirect_to "/playlists"
    end
  end

  def new
    playlist = Playlist.new
    render("new.slang")
  end

  def create
    playlist = Playlist.new(playlist_params.validate!)

    if playlist.valid? && playlist.save
      flash["success"] = "Created Playlist successfully."
      redirect_to "/playlists"
    else
      flash["danger"] = "Could not create Playlist!"
      render("new.slang")
    end
  end

  def edit
    if playlist = Playlist.find params["id"]
      render("edit.slang")
    else
      flash["warning"] = "Playlist with ID #{params["id"]} Not Found"
      redirect_to "/playlists"
    end
  end

  def update
    if playlist = Playlist.find(params["id"])
      playlist.set_attributes(playlist_params.validate!)
      if playlist.valid? && playlist.save
        flash["success"] = "Updated Playlist successfully."
        redirect_to "/playlists"
      else
        flash["danger"] = "Could not update Playlist!"
        render("edit.slang")
      end
    else
      flash["warning"] = "Playlist with ID #{params["id"]} Not Found"
      redirect_to "/playlists"
    end
  end

  def destroy
    if playlist = Playlist.find params["id"]
      playlist.destroy
    else
      flash["warning"] = "Playlist with ID #{params["id"]} Not Found"
    end
    redirect_to "/playlists"
  end

  def playlist_params
    params.validation do
      required(:name) { |f| !f.nil? }
      required(:description) { |f| !f.nil? }
      required(:duration) { |f| !f.nil? }
      required(:image) { |f| !f.nil? }
      required(:user_id) { |f| !f.nil? }
    end
  end
end
