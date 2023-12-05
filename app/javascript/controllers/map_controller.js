import { Controller } from "@hotwired/stimulus"
import mapboxgl from 'mapbox-gl'

// Connects to data-controller="map"
export default class extends Controller {
  static values = {
    apiKey: String,
    markers: Array,
    directions: Array,
    center: Array
  }
  connect() {
    mapboxgl.accessToken = this.apiKeyValue

    this.map = new mapboxgl.Map({
      container: this.element,
      style: "mapbox://styles/mapbox/streets-v12"
      })
    this.#addMarkersToMap()
    this.#fitMapToMarkers()
    this.map.on("load", () =>{
      this.#directionsRoute()
      this.#drawRadius(this.centerValue[1], this.centerValue[0])
    })
  }
  #addMarkersToMap() {
    this.markersValue.forEach((marker) => {
      // Create a HTML element for your custom marker
      const customMarker = document.createElement("div")
      customMarker.innerHTML = marker.marker_html

      new mapboxgl.Marker(customMarker)
        .setLngLat([marker.lng, marker.lat])
        .addTo(this.map)
    })
  }


  #getCircleRadius(zoom, radiusInKilometers, center) {
    const metersPerPixel = 40075016.686 * Math.abs(Math.cos(center[1] * Math.PI / 180)) / Math.pow(2, zoom + 8);
    return radiusInKilometers * 1000 / metersPerPixel;
  };

  #drawRadius(longitude, latitude) {
    const center = [longitude, latitude];
    const radius = 0.7; 

    this.map.addSource("circle", {
        "type": "geojson",
        "data": {
            "type": "Feature",
            "geometry": {
                "type": "Point",
                "coordinates": center
            }
        }
    });

    this.map.addLayer({
        "id": "circle",
        "source": "circle",
        "type": "circle",
        "paint": {
            "circle-radius": {
                'base': 2,
                'stops': [[0, 0], [22, this.#getCircleRadius(22, radius, center)]]
            },
            "circle-color": "#007cbf",
            "circle-opacity": 0.5
        }
    });
  }
  #fitMapToMarkers() {
    const bounds = new mapboxgl.LngLatBounds()
    this.markersValue.forEach(marker => bounds.extend([marker.lng, marker.lat]))
    this.map.fitBounds(bounds, { padding: 70, maxZoom: 15, duration: 0 })
  }
  #directionsRoute() {
    const color = [
      '#FF5733',
      '#33FF57',
      '#5733FF',
      '#FF33A1',
      '#33A1FF'
    ]
    this.directionsValue.forEach((direction, index) => {
      this.map.addSource(`directions${index}`, {
        type: "geojson",
        data: {
          type: "Feature",
          geometry: {
            type: "LineString",
            coordinates: direction
          }
        }
      })
      this.map.addLayer({
        id: `direction${index}`,
        type: "line",
        source: `directions${index}`,
        paint: {
          "line-width": 4,
          "line-color": color[index]
        }
      })
    })
  }
}
