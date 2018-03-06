- if artist.errors
  ul.errors
    - artist.errors.each do |error|
      li = error.to_s

== form(action: "/artists/#{artist.id.to_s}", method: artist.id ? :patch : :post) do
  == csrf_tag
  div.form-group
    == text_field(name: "name", value: artist.name, placeholder: "Name", class: "form-control")
  div.form-group
    == text_area(name: "biography", content: artist.biography, placeholder: "Biography", class: "form-control", size: "30x10")
  div.form-group
    == label(:country)
    == select_field(name: "country_id", collection: Country.all.map{|country| [country.id, country.id]}, selected: artist.country_id, class: "form-control")
  == submit("Submit", class: "btn btn-primary btn-xs")
  == link_to("back", "/artists", class: "btn btn-default btn-xs")
