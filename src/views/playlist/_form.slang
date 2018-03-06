- if playlist.errors
  ul.errors
    - playlist.errors.each do |error|
      li = error.to_s

== form(action: "/playlists/#{playlist.id.to_s}", method: playlist.id ? :patch : :post) do
  == csrf_tag
  div.form-group
    == text_field(name: "name", value: playlist.name, placeholder: "Name", class: "form-control")
  div.form-group
    == text_area(name: "description", content: playlist.description, placeholder: "Description", class: "form-control", size: "30x10")
  div.form-group
    == text_field(name: "duration", value: playlist.duration, placeholder: "Duration", class: "form-control")
  div.form-group
    == text_field(name: "image", value: playlist.image, placeholder: "Image", class: "form-control")
  div.form-group
    == label(:user)
    == select_field(name: "user_id", collection: User.all.map{|user| [user.id, user.id]}, selected: playlist.user_id, class: "form-control")
  == submit("Submit", class: "btn btn-primary btn-xs")
  == link_to("back", "/playlists", class: "btn btn-default btn-xs")
