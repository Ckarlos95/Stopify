.navbar-start
  - active = context.request.path == "/" ? "is-active" : ""
  a class="navbar-item #{active}" href="/" Home
  - active = context.request.path == "/artists" ? "is-active" : ""
  a class="navbar-item #{active}" href="/artists" Artists
  - active = context.request.path == "/albums" ? "is-active" : ""
  a class="navbar-item #{active}" href="/albums" Albums
  - active = context.request.path == "/songs" ? "is-active" : ""
  a class="navbar-item #{active}" href="/songs" Songs
  - active = context.request.path == "/playlists" ? "is-active" : ""
  a class="navbar-item #{active}" href="/playlists" Playlists

.navbar-end
  - if (current_user = context.current_user)
    a.navbar-item.pull-right href="/signout"
      | Sign Out
    - active = context.request.path == "/profile" ? "is-active" : ""
    a class="navbar-item #{active} pull-right" href="/profile"
      == current_user.email
  - else
    - active = context.request.path == "/signup" ? "is-active" : ""
    a class="navbar-item #{active} pull-right" href="/signup"
      | Sign Up
    - active = context.request.path == "/signin" ? "is-active" : ""
    a class="navbar-item #{active} pull-right" href="/signin"
      | Sign In
