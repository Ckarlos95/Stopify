doctype html
html
  head
    title Stopify using Amber
    meta charset="utf-8"
    meta http-equiv="X-UA-Compatible" content="IE=edge"
    meta name="viewport" content="width=device-width, initial-scale=1"
    /! Bulma CSS
    link rel="stylesheet" href="/dist/bower_components/bulma/css/bulma.css"
    /! FontAwesome
    link rel="stylesheet" href="/dist/bower_components/fontawesome/css/fontawesome-all.min.css"
    link rel="stylesheet" href="/dist/main.bundle.css"

  body
    nav.navbar.is-link role="navigation" aria-label="main navigation"
      == render(partial: "layouts/_nav.slang")
    section.section
      .container
        .columns
          .column
            - flash.each do |key, value|
              div class="message is-#{key}"
                .message-body = flash[key]
        .columns
          .column.main
            == content

    /! JQuery
    / script src="/dist/bower_components/jquery/dist/jquery.slim.min.js"
    script src="/dist/main.bundle.js"
