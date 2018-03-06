class AlbumController < ApplicationController
  def index
    albums = Album.all
    render("index.slang")
  end

  def show
    if album = Album.find params["id"]
      render("show.slang")
    else
      flash["warning"] = "Album with ID #{params["id"]} Not Found"
      redirect_to "/albums"
    end
  end

  def new
    album = Album.new
    render("new.slang")
  end

  def create
    album = Album.new(album_params.validate!)

    if album.valid? && album.save
      flash["success"] = "Created Album successfully."
      redirect_to "/albums"
    else
      flash["danger"] = "Could not create Album!"
      render("new.slang")
    end
  end

  def edit
    if album = Album.find params["id"]
      render("edit.slang")
    else
      flash["warning"] = "Album with ID #{params["id"]} Not Found"
      redirect_to "/albums"
    end
  end

  def update
    if album = Album.find(params["id"])
      album.set_attributes(album_params.validate!)
      if album.valid? && album.save
        flash["success"] = "Updated Album successfully."
        redirect_to "/albums"
      else
        flash["danger"] = "Could not update Album!"
        render("edit.slang")
      end
    else
      flash["warning"] = "Album with ID #{params["id"]} Not Found"
      redirect_to "/albums"
    end
  end

  def destroy
    if album = Album.find params["id"]
      album.destroy
    else
      flash["warning"] = "Album with ID #{params["id"]} Not Found"
    end
    redirect_to "/albums"
  end

  def album_params
    params.validation do
      required(:name) { |f| !f.nil? }
      required(:year) { |f| !f.nil? }
      required(:duration) { |f| !f.nil? }
      required(:image) { |f| !f.nil? }
      required(:plays) { |f| !f.nil? }
    end
  end
end
