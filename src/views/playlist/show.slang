h1 Show Playlist
p = playlist.name
p = playlist.description
p = playlist.duration
p = playlist.image
p = playlist.user.id
p
  == link_to("back", "/playlists", class: "btn btn-success btn-xs")
  == link_to("edit", "/playlists/#{playlist.id}/edit", class: "btn btn-success btn-xs")
  == link_to("delete", "/playlists/#{playlist.id}?_method=delete&_csrf=#{csrf_token}", class: "btn btn-danger btn-xs", onclick: "return confirm('Are you sure?');")
