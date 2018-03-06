h1 Show Song
p = song.name
p = song.duration
p = song.plays
p = song.disc.id
p
  == link_to("back", "/songs", class: "btn btn-success btn-xs")
  == link_to("edit", "/songs/#{song.id}/edit", class: "btn btn-success btn-xs")
  == link_to("delete", "/songs/#{song.id}?_method=delete&_csrf=#{csrf_token}", class: "btn btn-danger btn-xs", onclick: "return confirm('Are you sure?');")
