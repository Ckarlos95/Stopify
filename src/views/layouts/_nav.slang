- active = context.request.path == "/" ? "active" : ""
a class="nav-item #{active}" href="/" Home
- active = context.request.path == "/artists" ? "active" : ""
a class="nav-item #{active}" href="/artists" Artists
- active = context.request.path == "/albums" ? "active" : ""
a class="nav-item #{active}" href="/albums" Albums
- active = context.request.path == "/songs" ? "active" : ""
a class="nav-item #{active}" href="/songs" Songs
- active = context.request.path == "/playlists" ? "active" : ""
a class="nav-item #{active}" href="/playlists" Playlists
- if (current_user = context.current_user)
  a.nav-item.pull-right href="/signout"
    | Sign Out
  - active = context.request.path == "/profile" ? "active" : ""
  a class="nav-item #{active} pull-right" href="/profile"
    == current_user.email
- else
  - active = context.request.path == "/signup" ? "active" : ""
  a class="nav-item #{active} pull-right" href="/signup"
    | Sign Up
  - active = context.request.path == "/signin" ? "active" : ""
  a class="nav-item #{active} pull-right" href="/signin"
    | Sign In
