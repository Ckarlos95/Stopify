- if user.errors
  ul.errors
  - user.errors.each do |error|
    li.message
      .message-body = error.to_s

.columns
  .column.is-6.is-offset-3
    .box
      h1.is-size-1.has-text-centered Sign In
      hr
      form action="/session" method="post"
        == csrf_tag
        / Email
        .field
          label.label Email
          .control.has-icons-left
            input.input.is-medium type="email" name="email" placeholder="Type your email"
            span.icon.is-small.is-left
              i.fas.fa-at
        / Password
        .field
          label.label Password
          .control.has-icons-left
            input.input.is-medium type="password" name="password" placeholder="Your password"
            span.icon.is-small.is-left
              i.fas.fa-key
        br
        / Login button
        .has-text-centered
          button.button.is-link.is-outlined.is-medium.is-rounded type="submit"
            | Sign In
        hr
        == link_to("Don't have an account yet?", "/signup")
