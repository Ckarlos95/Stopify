- if song.errors
  ul.errors
    - song.errors.each do |error|
      li = error.to_s

== form(action: "/songs/#{song.id.to_s}", method: song.id ? :patch : :post) do
  == csrf_tag
  div.form-group
    == text_field(name: "name", value: song.name, placeholder: "Name", class: "form-control")
  div.form-group
    == text_field(name: "duration", value: song.duration, placeholder: "Duration", class: "form-control")
  div.form-group
    == text_field(name: "plays", value: song.plays, placeholder: "Plays", class: "form-control")
  div.form-group
    == label(:disc)
    == select_field(name: "disc_id", collection: Disc.all.map{|disc| [disc.id, disc.id]}, selected: song.disc_id, class: "form-control")
  == submit("Submit", class: "btn btn-primary btn-xs")
  == link_to("back", "/songs", class: "btn btn-default btn-xs")
