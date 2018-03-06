class ArtistController < ApplicationController
  def index
    artists = Artist.all
    render("index.slang")
  end

  def show
    if artist = Artist.find params["id"]
      render("show.slang")
    else
      flash["warning"] = "Artist with ID #{params["id"]} Not Found"
      redirect_to "/artists"
    end
  end

  def new
    artist = Artist.new
    render("new.slang")
  end

  def create
    artist = Artist.new(artist_params.validate!)

    if artist.valid? && artist.save
      flash["success"] = "Created Artist successfully."
      redirect_to "/artists"
    else
      flash["danger"] = "Could not create Artist!"
      render("new.slang")
    end
  end

  def edit
    if artist = Artist.find params["id"]
      render("edit.slang")
    else
      flash["warning"] = "Artist with ID #{params["id"]} Not Found"
      redirect_to "/artists"
    end
  end

  def update
    if artist = Artist.find(params["id"])
      artist.set_attributes(artist_params.validate!)
      if artist.valid? && artist.save
        flash["success"] = "Updated Artist successfully."
        redirect_to "/artists"
      else
        flash["danger"] = "Could not update Artist!"
        render("edit.slang")
      end
    else
      flash["warning"] = "Artist with ID #{params["id"]} Not Found"
      redirect_to "/artists"
    end
  end

  def destroy
    if artist = Artist.find params["id"]
      artist.destroy
    else
      flash["warning"] = "Artist with ID #{params["id"]} Not Found"
    end
    redirect_to "/artists"
  end

  def artist_params
    params.validation do
      required(:name) { |f| !f.nil? }
      required(:biography) { |f| !f.nil? }
      required(:country_id) { |f| !f.nil? }
    end
  end
end
