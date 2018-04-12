Vue = require 'vue/dist/vue'
VueResource = require 'vue-resource'
Vue.use VueResource

vm = new Vue
  el: '#app'
  data:
    currentDB: 'default'
    currentTable: 'default'
    databases: []
    tables: []
    tableDesc: []

  created: ->
    @loadDatabases()

  methods:
    loadDatabases: ->
      this.$http.get('/admin/databases').then (response) ->
        @databases = response.body
      , (error) ->
        console.log 'An error ocurred when trying to load databases'
        console.log error

    loadTables: ->
      @currentTable = 'default'
      @tableDesc = []
      
      this.$http.get "/admin/tables",
        params:
          database: @currentDB
      .then (response) ->
        @tables = response.body
      , (error) ->
        console.log "An error ocurred when trying to
          load tables in `#{@currentDB}`"
        console.log error

    loadTableDesc: ->
      if @currentTable isnt 'default'
        this.$http.get "/admin/table_desc",
          params:
            database: @currentDB
            table: @currentTable
        .then (response) ->
          @tableDesc = response.body
        , (error) ->
          console.log "An error ocurred when trying to load table
            description for `#{@currentDB}`.`#{@currentTable}`"
          console.log error
