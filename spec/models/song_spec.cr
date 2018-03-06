require "./spec_helper"
require "../../src/models/song.cr"

describe Song do
  Spec.before_each do
    Song.clear
  end
end
