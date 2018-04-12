- if user.errors
  ul.errors
  - user.errors.each do |error|
    li.message
      .message-body = error.to_s

.columns
  .column.is-6.is-offset-3
    .box
      h1.is-size-1.has-text-centered Sign Up
      hr
      form action="/registration" method="post"
        == csrf_tag
        / Name
        .field
          label.label Name
          .control.has-icons-left
            input.input type="text" name="name" placeholder="Write your name here"
            span.icon.is-small.is-left
              i.fas.fa-user
        / Email
        .field
          label.label Email
          .control.has-icons-left
            input.input type="email" name="email" placeholder="And your email here"
            span.icon.is-small.is-left
              i.fas.fa-at
        / Password
        .field
          label.label Password
          .control.has-icons-left
            input.input type="password" name="password" placeholder="A password (must be at least 8 characters length)"
            span.icon.is-small.is-left
              i.fas.fa-key
        / Birthday
        .field
          label.label Choose your birthday
          .control.has-icons-left
            input.input type="date" name="birthday"
            span.icon.is-small.is-left
              i.fas.fa-birthday-cake
        / Gender
        .field.is-horizontal
          .field-label.is-normal
            label.label Choose your gender
          .field-body
            .field
              .control
                .select
                  select name="gender"
                    option value="0" Unknown
                    option value="1" selected="true" Male
                    option value="2" Female
                    option value="3" Not applicable
        / Country
        .field.is-horizontal
          .field-label.is-normal
            label.label Which country are you from?
          .field-body
            .field
              .control
                .select
                  select name="country_id"
                    - Country.all.each do |country|
                      option value=country.id = country.name
        br
        / Register button
        .has-text-centered
          button.button.is-link.is-outlined.is-medium.is-rounded type="submit"
            | Register
        hr
        == link_to("Already have an account?", "/signin")

/ script src="/dist/bower_components/vue/dist/vue.js"
/ script src="/dist/vue_components/typeahead.js"
