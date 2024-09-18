class CustomDataTypeGeorefFacet extends FieldFacet

  initOpts: ->
      super()
      @addOpts
          field:
              mandatory: true
              check: Field

  requestFacetWithLimit: (obj) ->
      limit: @getLimit()
      field: @_field.fullName()+".facetTerm"
      sort: "count"
      type: "term"

  getObjects: (key=@name(), data=@data()) ->
      data[key]?.terms or []

  renderObjectText: (object) ->
      object.term

  getObjectPath: (obj) ->
      [obj.term]

  name: ->
      @_field.fullName()+".facetTerm"

  requestSearchFilter: (obj) ->
      bool: "must"
      fields: [ @_field.fullName()+".facetTerm" ]
      type: "in"
      in: [ obj.term ]