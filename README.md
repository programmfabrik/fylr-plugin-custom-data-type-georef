> This Plugin / Repo is being maintained by a community of developers.
There is no warranty given or bug fixing guarantee; especially not by
Programmfabrik GmbH. Please use the github issue tracking to report bugs
and self organize bug fixing. Feel free to directly contact the committing
developers.

# fylr-plugin-custom-data-type-georef

This is a plugin for [fyr](http://docs.fylr.io/) with Custom Data Type `CustomDataTypeGeoref` for referencing to geoJSON-Objects. See [http://geojson.org/](http://geojson.org/) and https://de.wikipedia.org/wiki/GeoJSON

The Plugins uses the [Mapbox-API](https://www.mapbox.com/api-documentation/) for the Map-Rendering and magic. You can set Polygons, Linestrings and Points on the worldmap. This is saved in geojson-Format.

## installation
The latest version of this plugin can be found [here](https://github.com/programmfabrik/fylr-plugin-custom-data-type-georef/releases/latest/download/customDataTypeGeoref.zip).

The ZIP can be downloaded and installed using the plugin manager, or used directly (recommended).

Github has an overview page to get a list of [all releases](https://github.com/programmfabrik/fylr-plugin-custom-data-type-georef/releases/).

## configuration

As defined in `manifest.master.yml` this datatype can be configured:

### Schema options

* which "mapbpox-API-key" to use
* show "geocoder" for adresssearch?
* allow to add POINT via text?
* allow to add LINESTRING via text?
* allow to add POLYGON via text?

### Mask options

* none

## saved data

* conceptName
    * type of geoFeature (polygon, point, line)
* conceptURI
    * information in geoJSON-standard-format
* conceptGeoJSON
    * information in geoJSON-standard-format
* _fulltext
    * easydb-fulltext
* _standard
    * easydb-standard
* _standard.geo
    * easydb-standard
* facetTerm
    * easydb-standard

## sources

The source code of this plugin is managed in a git repository at <https://github.com/programmfabrik/fylr-plugin-custom-data-type-georef>
