div.row
  div.col-sm-11
    h2 Songs
  div.col-sm-1
    a.btn.btn-success.btn-xs href="/songs/new" New
div.table-responsive
  table.table.table-striped
    thead
      tr
        th Name
        th Duration
        th Plays
        th Disc
        th Actions
    tbody
      - songs.each do |song|
        tr
          td = song.name
          td = song.duration
          td = song.plays
          td = song.disc.id
          td
            span
              == link_to("read", "/songs/#{song.id}", class: "btn btn-success btn-xs")
              == link_to("edit", "/songs/#{song.id}/edit", class: "btn btn-success btn-xs")
              == link_to("delete", "/songs/#{ song.id }?_method=delete&_csrf=#{csrf_token}", class: "btn btn-danger btn-xs", onclick: "return confirm('Are you sure?');")
