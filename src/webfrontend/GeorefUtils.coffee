class GeorefUtils

  ########################################################################
  #generates a json-structure, which is only used for facetting (aka filter) in frontend
  ########################################################################
  @getFacetTerm: (label, databaseLanguages) ->

    shortenedDatabaseLanguages = databaseLanguages.map((value, key, array) ->
      value.split('-').shift()
    )

    _facet_term = {}
    l10nObject = {}

    # init l10nObject
    for language in databaseLanguages
      l10nObject[language] = ''

    # build facetTerm upon prefLabel and uri!
    hasl10n = false

    for l10nObjectKey, l10nObjectValue of l10nObject
      l10nObject[l10nObjectKey] = label

    # if l10n-object is not empty
    _facet_term = l10nObject
    return _facet_term