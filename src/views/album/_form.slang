- if album.errors
  ul.errors
    - album.errors.each do |error|
      li = error.to_s

== form(action: "/albums/#{album.id.to_s}", method: album.id ? :patch : :post) do
  == csrf_tag
  div.form-group
    == text_field(name: "name", value: album.name, placeholder: "Name", class: "form-control")
  div.form-group
    == text_field(name: "year", value: album.year, placeholder: "Year", class: "form-control")
  div.form-group
    == text_field(name: "duration", value: album.duration, placeholder: "Duration", class: "form-control")
  div.form-group
    == text_field(name: "image", value: album.image, placeholder: "Image", class: "form-control")
  div.form-group
    == text_field(name: "plays", value: album.plays, placeholder: "Plays", class: "form-control")
  == submit("Submit", class: "btn btn-primary btn-xs")
  == link_to("back", "/albums", class: "btn btn-default btn-xs")
