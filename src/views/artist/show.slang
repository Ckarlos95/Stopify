h1 Show Artist
p = artist.name
p = artist.biography
p = artist.country.id
p
  == link_to("back", "/artists", class: "btn btn-success btn-xs")
  == link_to("edit", "/artists/#{artist.id}/edit", class: "btn btn-success btn-xs")
  == link_to("delete", "/artists/#{artist.id}?_method=delete&_csrf=#{csrf_token}", class: "btn btn-danger btn-xs", onclick: "return confirm('Are you sure?');")
