class SongController < ApplicationController
  def index
    songs = Song.all
    render("index.slang")
  end

  def show
    if song = Song.find params["id"]
      render("show.slang")
    else
      flash["warning"] = "Song with ID #{params["id"]} Not Found"
      redirect_to "/songs"
    end
  end

  def new
    song = Song.new
    render("new.slang")
  end

  def create
    song = Song.new(song_params.validate!)

    if song.valid? && song.save
      flash["success"] = "Created Song successfully."
      redirect_to "/songs"
    else
      flash["danger"] = "Could not create Song!"
      render("new.slang")
    end
  end

  def edit
    if song = Song.find params["id"]
      render("edit.slang")
    else
      flash["warning"] = "Song with ID #{params["id"]} Not Found"
      redirect_to "/songs"
    end
  end

  def update
    if song = Song.find(params["id"])
      song.set_attributes(song_params.validate!)
      if song.valid? && song.save
        flash["success"] = "Updated Song successfully."
        redirect_to "/songs"
      else
        flash["danger"] = "Could not update Song!"
        render("edit.slang")
      end
    else
      flash["warning"] = "Song with ID #{params["id"]} Not Found"
      redirect_to "/songs"
    end
  end

  def destroy
    if song = Song.find params["id"]
      song.destroy
    else
      flash["warning"] = "Song with ID #{params["id"]} Not Found"
    end
    redirect_to "/songs"
  end

  def song_params
    params.validation do
      required(:name) { |f| !f.nil? }
      required(:duration) { |f| !f.nil? }
      required(:plays) { |f| !f.nil? }
      required(:disc_id) { |f| !f.nil? }
    end
  end
end
