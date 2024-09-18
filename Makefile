ZIP_NAME ?= "customDataTypeGeoref.zip"
PLUGIN_NAME = "custom-data-type-georef"

# coffescript-files to compile
COFFEE_FILES = commons.coffee \
	CustomDataTypeGeoref.coffee \
	CustomDataTypeGeorefFacet.coffee \
	GeorefUtils.coffee

MAPBOX1 = src/external/mapbox-gl.js
MAPBOX2 = src/external/mapbox-gl-draw.js
MAPBOX3 = src/external/geojson-extent.js
MAPBOX4 = src/external/geo-viewport.js
MAPBOX5 = src/external/mapbox-gl-geocoder.min.js

TURF_REWIND = src/external/turfRewind.js

CSS_FILE      = src/webfrontend/css/main.css
CSSGEOCODER   = src/external/mapbox-gl-geocoder.css
CSSGLDRAW     = src/external/mapbox_gl_draw.css
CSSADDITIONAL = src/external/mapbox.css

help:
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'

all: build ## build all

build: clean ## clean, compile, copy files to build folder

				mkdir -p build
				mkdir -p build/$(PLUGIN_NAME)
				mkdir -p build/$(PLUGIN_NAME)/webfrontend
				mkdir -p build/$(PLUGIN_NAME)/l10n

				cp src/webfrontend/css/main.css build/$(PLUGIN_NAME)/webfrontend/customDataTypeGeoref.css # copy css
				cat $(CSS_FILE) $(CSSGEOCODER) $(CSSGLDRAW) $(CSSADDITIONAL) >> build/$(PLUGIN_NAME)/webfrontend/customDataTypeGeoref.css

				mkdir -p src/tmp # build code from coffee
				cp easydb-library/src/commons.coffee src/tmp
				cp src/webfrontend/*.coffee src/tmp
				cd src/tmp && coffee -b --compile ${COFFEE_FILES} # bare-parameter is obligatory!

				# first: commons! Important
				cat src/tmp/commons.js > build/$(PLUGIN_NAME)/webfrontend/customDataTypeGeoref.js
				cat src/tmp/CustomDataTypeGeoref.js >> build/$(PLUGIN_NAME)/webfrontend/customDataTypeGeoref.js
				cat src/tmp/CustomDataTypeGeorefFacet.js >> build/$(PLUGIN_NAME)/webfrontend/customDataTypeGeoref.js
				cat src/tmp/GeorefUtils.js >> build/$(PLUGIN_NAME)/webfrontend/customDataTypeGeoref.js

				cat $(MAPBOX1) $(MAPBOX2) $(MAPBOX3) $(MAPBOX4) $(MAPBOX5) $(TURF_REWIND) >> build/$(PLUGIN_NAME)/webfrontend/customDataTypeGeoref.js

				cp l10n/custom-data-type-georef.csv build/$(PLUGIN_NAME)/l10n/customDataTypeGeoref.csv # copy l10n
				
				cp manifest.master.yml build/$(PLUGIN_NAME)/manifest.yml # copy manifest

clean: ## clean
				rm -rf build

zip: build ## build zip file
			cd build && zip ${ZIP_NAME} -r $(PLUGIN_NAME)/