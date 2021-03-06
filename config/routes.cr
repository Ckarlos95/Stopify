Amber::Server.configure do |app|
  pipeline :web do

    # Plug is the method to use connect a pipe (middleware)
    # A plug accepts an instance of HTTP::Handler
    plug Amber::Pipe::PoweredByAmber.new
    # plug Amber::Pipe::ClientIp.new(["X-Forwarded-For"])
    plug Amber::Pipe::Error.new
    plug Amber::Pipe::Logger.new
    plug Amber::Pipe::Session.new
    plug Amber::Pipe::Flash.new
    plug Amber::Pipe::CSRF.new
    # Reload clients browsers (development only)
    plug Amber::Pipe::Reload.new if Amber.env.development?

    plug Authenticate.new
  end

  # All static content will run these transformations
  pipeline :static do
    plug Amber::Pipe::PoweredByAmber.new
    # plug Amber::Pipe::ClientIp.new(["X-Forwarded-For"])
    plug Amber::Pipe::Error.new
    plug Amber::Pipe::Static.new("./public")
  end

  routes :static do
    # Each route is defined as follow
    # verb resource : String, controller : Symbol, action : Symbol
    get "/*", Amber::Controller::Static, :index
  end

  routes :web do
    get "/profile", UserController, :show
    get "/profile/edit", UserController, :edit
    patch "/profile", UserController, :update
    get "/signin", SessionController, :new
    post "/session", SessionController, :create
    get "/signout", SessionController, :delete
    get "/signup", RegistrationController, :new
    post "/registration", RegistrationController, :create
    # get "/artist/:id/albums", AlbumController, :index
    resources "/playlists", PlaylistController
    resources "/songs", SongController
    resources "/albums", AlbumController
    resources "/artists", ArtistController
    get "/", SessionController, :new
    # get "/", HomeController, :index
  end

  routes :web, "/admin" do
    get "/dashboard", AdminController, :dashboard
    get "/databases", AdminController, :databases
    get "/tables", AdminController, :tables
    get "/table_desc", AdminController, :table_desc
  end
  #
  # routes :web, "/artist/albums/:album_id" do
  #   resources "/songs", SongController
  # end
end
