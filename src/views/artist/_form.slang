- if artist.errors
  ul.errors
    - artist.errors.each do |error|
      li = error.to_s

== form(action: "/artists/#{artist.id.to_s}", method: artist.id ? :patch : :post) do
  == csrf_tag
  .field
    label.label Name
    .control
      == text_field(name: "name", value: artist.name, placeholder: "The artist name", class: "input")
  .field
    label.label Biography
    .control
    == text_area(name: "biography", content: artist.biography, placeholder: "Write a short description/history about this artist", class: "textarea")
  .field
    == label(:country, class: "label")
    .control
      .select
        == select_field(name: "country_id", collection: Country.all.map{|country| [country.id, country.name]}, selected: artist.country_id)
  br
  .has-text-centered
    == submit("Submit", class: "button is-link is-outlined is-medium is-rounded")
  == link_to("back", "/artists", class: "btn btn-default btn-xs")
