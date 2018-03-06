div.row
  div.col-sm-11
    h2 Playlists
  div.col-sm-1
    a.btn.btn-success.btn-xs href="/playlists/new" New
div.table-responsive
  table.table.table-striped
    thead
      tr
        th Name
        th Description
        th Duration
        th Image
        th User
        th Actions
    tbody
      - playlists.each do |playlist|
        tr
          td = playlist.name
          td = playlist.description
          td = playlist.duration
          td = playlist.image
          td = playlist.user.id
          td
            span
              == link_to("read", "/playlists/#{playlist.id}", class: "btn btn-success btn-xs")
              == link_to("edit", "/playlists/#{playlist.id}/edit", class: "btn btn-success btn-xs")
              == link_to("delete", "/playlists/#{ playlist.id }?_method=delete&_csrf=#{csrf_token}", class: "btn btn-danger btn-xs", onclick: "return confirm('Are you sure?');")
