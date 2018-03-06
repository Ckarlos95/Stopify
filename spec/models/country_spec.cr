require "./spec_helper"
require "../../src/models/country.cr"

describe Country do
  Spec.before_each do
    Country.clear
  end
end
