div.row
  div.col-sm-11
    h2 Albums
  div.col-sm-1
    a.btn.btn-success.btn-xs href="/albums/new" New
div.table-responsive
  table.table.table-striped
    thead
      tr
        th Name
        th Year
        th Duration
        th Image
        th Plays
        th Actions
    tbody
      - albums.each do |album|
        tr
          td = album.name
          td = album.year
          td = album.duration
          td = album.image
          td = album.plays
          td
            span
              == link_to("read", "/albums/#{album.id}", class: "btn btn-success btn-xs")
              == link_to("edit", "/albums/#{album.id}/edit", class: "btn btn-success btn-xs")
              == link_to("delete", "/albums/#{ album.id }?_method=delete&_csrf=#{csrf_token}", class: "btn btn-danger btn-xs", onclick: "return confirm('Are you sure?');")
