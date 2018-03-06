doctype html
html
  head
    title Stopify using Amber
    meta charset="utf-8"
    meta http-equiv="X-UA-Compatible" content="IE=edge"
    meta name="viewport" content="width=device-width, initial-scale=1"
    / link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"
    link rel="stylesheet" href="/dist/bower_components/bulma/css/bulma.css"
    link rel="stylesheet" href="/dist/main.bundle.css"

  body
    div.masthead
      div.container
        nav.nav
          == render(partial: "layouts/_nav.slang")
    div.container
      div.row
        - flash.each do |key, value|
          div class="alert alert-#{key}"
            p = flash[key]
      div.row
        div.col-sm-12.main
          == content

    /! JQuery include
    script src="/dist/bower_components/jquery/dist/jquery.min.js"
    script src="/dist/main.bundle.js"
