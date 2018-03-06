require "./spec_helper"

def song_hash
  {"name" => "Fake", "duration" => "2018-03-06 13:14:59 -06:00", "plays" => "1", "disc_id" => "1"}
end

def song_params
  params = [] of String
  params << "name=#{song_hash["name"]}"
  params << "duration=#{song_hash["duration"]}"
  params << "plays=#{song_hash["plays"]}"
  params << "disc_id=#{song_hash["disc_id"]}"
  params.join("&")
end

def create_song
  model = Song.new(song_hash)
  model.save
  model
end

class SongControllerTest < GarnetSpec::Controller::Test
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

describe SongControllerTest do
  subject = SongControllerTest.new

  it "renders song index template" do
    Song.clear
    response = subject.get "/songs"

    response.status_code.should eq(200)
    response.body.should contain("Songs")
  end

  it "renders song show template" do
    Song.clear
    model = create_song
    location = "/songs/#{model.id}"

    response = subject.get location

    response.status_code.should eq(200)
    response.body.should contain("Show Song")
  end

  it "renders song new template" do
    Song.clear
    location = "/songs/new"

    response = subject.get location

    response.status_code.should eq(200)
    response.body.should contain("New Song")
  end

  it "renders song edit template" do
    Song.clear
    model = create_song
    location = "/songs/#{model.id}/edit"

    response = subject.get location

    response.status_code.should eq(200)
    response.body.should contain("Edit Song")
  end

  it "creates a song" do
    Song.clear
    response = subject.post "/songs", body: song_params

    response.headers["Location"].should eq "/songs"
    response.status_code.should eq(302)
    response.body.should eq "302"
  end

  it "updates a song" do
    Song.clear
    model = create_song
    response = subject.patch "/songs/#{model.id}", body: song_params

    response.headers["Location"].should eq "/songs"
    response.status_code.should eq(302)
    response.body.should eq "302"
  end

  it "deletes a song" do
    Song.clear
    model = create_song
    response = subject.delete "/songs/#{model.id}"

    response.headers["Location"].should eq "/songs"
    response.status_code.should eq(302)
    response.body.should eq "302"
  end
end
