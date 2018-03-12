class RegistrationController < ApplicationController
  def new
    user = User.new
    render("new.slang")
  end

  def create
    user = User.new(registration_params.validate!)
    country = Country.find params["country"].to_i
    if country
      user.country = country
    end
    user.password = params["password"].to_s
    user.gender = params["gender"].to_i
    user.birthday = Time.parse params["birthday"].to_s, "%F"
    user.role = 2

    if user.valid? && user.save
      session[:user_id] = user.id
      flash["success"] = "Created User successfully."
      redirect_to "/"
    else
      flash["danger"] = "Could not create User!"
      render("new.slang")
    end
  end

  private def registration_params
    params.validation do
      required(:email) { |f| !f.nil? }
      required(:password) { |f| !f.nil? }
      required(:name) { |f| !f.nil? }
      required(:birthday) { |f| !f.nil? }
      required(:gender) { |f| !f.nil? }
      required(:country) { |f| !f.nil? }
    end
  end
end
