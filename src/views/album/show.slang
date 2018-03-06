h1 Show Album
p = album.name
p = album.year
p = album.duration
p = album.image
p = album.plays
p
  == link_to("back", "/albums", class: "btn btn-success btn-xs")
  == link_to("edit", "/albums/#{album.id}/edit", class: "btn btn-success btn-xs")
  == link_to("delete", "/albums/#{album.id}?_method=delete&_csrf=#{csrf_token}", class: "btn btn-danger btn-xs", onclick: "return confirm('Are you sure?');")
