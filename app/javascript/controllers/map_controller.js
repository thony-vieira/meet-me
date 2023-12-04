import { Controller } from "@hotwired/stimulus"
import mapboxgl from 'mapbox-gl'

// Connects to data-controller="map"
export default class extends Controller {
  static values = {
    apiKey: String,
    markers: Array,
    directions: Array
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
    })
  }
  #addMarkersToMap() {
    this.markersValue.forEach((marker) => {
      new mapboxgl.Marker()
        .setLngLat([marker.lng, marker.lat])
        .addTo(this.map)
    })
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
