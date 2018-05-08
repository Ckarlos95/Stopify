css:
  .table-description {
    max-width: 1088px;
    display: block;
    overflow-x: auto;
    white-space: nowrap;
  }

- titles = {"Field", "Type", "Null", "Key", "Default", "Extra"}

.tile.is-ancestor
  .tile.is-vertical
    .tile.is-parent
      article#data-sources.tile.is-child.notification.is-info
        p.title Data Sources
        .content
          .columns
            .column
              .control.has-icons-left
                .select.is-rounded.is-fullwidth
                  select.has-text-centered v-bind:class="{ 'has-text-danger has-text-weight-bold': dbNotDefault }" v-on:change="loadTables" v-model="currentDB"
                    option disabled="true" value="default" -- Choose a DB schema --
                    option v-for="database in databases" v-bind:value="database" {{ database }}
                  span.icon.is-left.has-text-link
                    i.fas.fa-database

            .column
              .control.has-icons-left
                .select.is-rounded.is-fullwidth
                  select.has-text-centered v-bind:class="{ 'has-text-link has-text-weight-bold': tableNotDefault }" v-on:change="loadTableDesc" v-model="currentTable"
                    option disabled="true" value="default" -- Choose a table --
                    option v-for="table in tables" v-bind:value="table" {{ table }}
                  span.icon.is-left.has-text-link
                    i.fas.fa-table

          .table-description
            table.table v-show="descNotEmpty"
              thead
                tr
                  - titles.each do |title|
                    th = title
              tbody
                tr v-for="row in tableDesc"
                  td {{ row.field }}
                  td {{ row.type }}
                  td {{ row.null }}
                  td {{ row.key }}
                  td {{ row.default }}
                  td {{ row.extra }}

    .tile.is-parent
      article.tile.is-child.notification.is-info
        p.title Generate Model
        .content
          .tile.is-ancestor
            .tile
              .tile.is-parent
                article#dimensions.tile.is-child.notification.is-danger
                  p.title Define Dimensions
                  .content
                    .columns.is-centered
                      .column.is-half.is-narrow
                        .field.is-horizontal
                          .field-label
                            label.label Number of Dimensions
                          .field-body
                            .field
                              .control
                                input.input type="number" min="3" v-model="size"
                    .field.is-horizontal
                      .field-label
                        label.label Name of Dimension
                      .field-body
                        .field
                          .control
                            input.input type="text" v-model="name"
                    .field
                      label.label Dimension Attributes
                      .menu
                        ul.menu-list
                          li v-for="row in tableDesc"
                            a.m-item.is-active v-on:click="addAttr(row.field)"
                              | {{ row.field }}:
                              span.has-text-danger {{ row.type }}

              .tile.is-parent
                article#fact-table.tile.is-child.notification.is-success
                  p.title Define Fact-Table
                  .content
                    .tile.is-ancestor
                      .tile.is-vertical
                        .tile.is-parent
                          article.tile.is-child.notification.is-warning
                            p.title Select Measurements

                        .tile.is-parent
                          article.tile.is-child.notification.is-warning
                            p.title Generate Fact-Table

script src="/dist/admin_dashboard.bundle.js"
