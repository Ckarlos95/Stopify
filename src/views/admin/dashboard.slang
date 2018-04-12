- titles = {"Field", "Type", "Null", "Key", "Default", "Extra"}

#app
  h1 Admin Dashboard
  select v-on:change="loadTables" v-model="currentDB"
    option disabled="true" value="default" Selecciona una base de datos
    option v-for="db in databases" v-bind:value="db" {{ db }}

  select v-on:change="loadTableDesc" v-model="currentTable"
    option disabled="true" value="default" Selecciona una tabla
    option v-for="tb in tables" v-bind:value="tb" {{ tb }}

  table v-show="tableDesc.length"
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

  pre {{ tableDesc }}

script src="/dist/admin_dashboard.bundle.js"
