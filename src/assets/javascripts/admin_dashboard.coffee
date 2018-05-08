Vue = require 'vue/dist/vue'
VueResource = require 'vue-resource'
Vue.use VueResource

dataSources = new Vue
  el: '#data-sources'
  data:
    currentDB: 'default'
    currentTable: 'default'
    databases: []
    tables: []
    tableDesc: []

  computed:
    descNotEmpty: ->
      @tableDesc.length > 0

    tableNotDefault: ->
      @currentTable isnt 'default'

    dbNotDefault: ->
      @currentDB isnt 'default'

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
      .then (response) =>
        @tables = response.body
      , (error) ->
        console.log "An error ocurred when trying to load tables in `#{@currentDB}`"
        console.log error

    loadTableDesc: ->
      if @tableNotDefault
        this.$http.get "/admin/table_desc",
          params:
            database: @currentDB
            table: @currentTable
        .then (response) ->
          dimensions.tableDesc = @tableDesc = response.body
        , (error) ->
          console.log "An error ocurred when trying to load table description for `#{@currentDB}`.`#{@currentTable}`"
          console.log error

dimensions = new Vue
  el: '#dimensions'
  data:
    size: 3
    name: ''
    attributes: []
    tableDesc: []

  methods:
    addAttr: (attr) ->
      @attributes.push attr unless attr in @attributes
