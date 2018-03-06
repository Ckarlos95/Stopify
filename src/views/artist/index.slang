div.row
  div.col-sm-11
    h2 Artists
  div.col-sm-1
    a.btn.btn-success.btn-xs href="/artists/new" New
div.table-responsive
  table.table.table-striped
    thead
      tr
        th Name
        th Biography
        th Country
        th Actions
    tbody
      - artists.each do |artist|
        tr
          td = artist.name
          td = artist.biography
          td = artist.country.id
          td
            span
              == link_to("read", "/artists/#{artist.id}", class: "btn btn-success btn-xs")
              == link_to("edit", "/artists/#{artist.id}/edit", class: "btn btn-success btn-xs")
              == link_to("delete", "/artists/#{ artist.id }?_method=delete&_csrf=#{csrf_token}", class: "btn btn-danger btn-xs", onclick: "return confirm('Are you sure?');")
