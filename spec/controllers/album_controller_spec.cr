require "./spec_helper"

def album_hash
  {"name" => "Fake", "year" => "1", "duration" => "2018-03-06 13:07:00 -06:00", "image" => "Fake", "plays" => "1"}
end

def album_params
  params = [] of String
  params << "name=#{album_hash["name"]}"
  params << "year=#{album_hash["year"]}"
  params << "duration=#{album_hash["duration"]}"
  params << "image=#{album_hash["image"]}"
  params << "plays=#{album_hash["plays"]}"
  params.join("&")
end

def create_album
  model = Album.new(album_hash)
  model.save
  model
end

class AlbumControllerTest < GarnetSpec::Controller::Test
  getter handler : Amber::Pipe::Pipeline

  def initialize
    @handler = Amber::Pipe::Pipeline.new
    @handler.build :web do
      plug Amber::Pipe::Error.new
      plug Amber::Pipe::Session.new
      plug Amber::Pipe::Flash.new
    end
    @handler.prepare_pipelines
  end
end

describe AlbumControllerTest do
  subject = AlbumControllerTest.new

  it "renders album index template" do
    Album.clear
    response = subject.get "/albums"

    response.status_code.should eq(200)
    response.body.should contain("Albums")
  end

  it "renders album show template" do
    Album.clear
    model = create_album
    location = "/albums/#{model.id}"

    response = subject.get location

    response.status_code.should eq(200)
    response.body.should contain("Show Album")
  end

  it "renders album new template" do
    Album.clear
    location = "/albums/new"

    response = subject.get location

    response.status_code.should eq(200)
    response.body.should contain("New Album")
  end

  it "renders album edit template" do
    Album.clear
    model = create_album
    location = "/albums/#{model.id}/edit"

    response = subject.get location

    response.status_code.should eq(200)
    response.body.should contain("Edit Album")
  end

  it "creates a album" do
    Album.clear
    response = subject.post "/albums", body: album_params

    response.headers["Location"].should eq "/albums"
    response.status_code.should eq(302)
    response.body.should eq "302"
  end

  it "updates a album" do
    Album.clear
    model = create_album
    response = subject.patch "/albums/#{model.id}", body: album_params

    response.headers["Location"].should eq "/albums"
    response.status_code.should eq(302)
    response.body.should eq "302"
  end

  it "deletes a album" do
    Album.clear
    model = create_album
    response = subject.delete "/albums/#{model.id}"

    response.headers["Location"].should eq "/albums"
    response.status_code.should eq(302)
    response.body.should eq "302"
  end
end
