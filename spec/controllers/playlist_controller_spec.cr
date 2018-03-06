require "./spec_helper"

def playlist_hash
  {"name" => "Fake", "description" => "Fake", "duration" => "2018-03-06 13:22:16 -06:00", "image" => "Fake", "user_id" => "1"}
end

def playlist_params
  params = [] of String
  params << "name=#{playlist_hash["name"]}"
  params << "description=#{playlist_hash["description"]}"
  params << "duration=#{playlist_hash["duration"]}"
  params << "image=#{playlist_hash["image"]}"
  params << "user_id=#{playlist_hash["user_id"]}"
  params.join("&")
end

def create_playlist
  model = Playlist.new(playlist_hash)
  model.save
  model
end

class PlaylistControllerTest < GarnetSpec::Controller::Test
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

describe PlaylistControllerTest do
  subject = PlaylistControllerTest.new

  it "renders playlist index template" do
    Playlist.clear
    response = subject.get "/playlists"

    response.status_code.should eq(200)
    response.body.should contain("Playlists")
  end

  it "renders playlist show template" do
    Playlist.clear
    model = create_playlist
    location = "/playlists/#{model.id}"

    response = subject.get location

    response.status_code.should eq(200)
    response.body.should contain("Show Playlist")
  end

  it "renders playlist new template" do
    Playlist.clear
    location = "/playlists/new"

    response = subject.get location

    response.status_code.should eq(200)
    response.body.should contain("New Playlist")
  end

  it "renders playlist edit template" do
    Playlist.clear
    model = create_playlist
    location = "/playlists/#{model.id}/edit"

    response = subject.get location

    response.status_code.should eq(200)
    response.body.should contain("Edit Playlist")
  end

  it "creates a playlist" do
    Playlist.clear
    response = subject.post "/playlists", body: playlist_params

    response.headers["Location"].should eq "/playlists"
    response.status_code.should eq(302)
    response.body.should eq "302"
  end

  it "updates a playlist" do
    Playlist.clear
    model = create_playlist
    response = subject.patch "/playlists/#{model.id}", body: playlist_params

    response.headers["Location"].should eq "/playlists"
    response.status_code.should eq(302)
    response.body.should eq "302"
  end

  it "deletes a playlist" do
    Playlist.clear
    model = create_playlist
    response = subject.delete "/playlists/#{model.id}"

    response.headers["Location"].should eq "/playlists"
    response.status_code.should eq(302)
    response.body.should eq "302"
  end
end
