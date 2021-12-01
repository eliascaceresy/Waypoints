import React, { useEffect, useState } from "react"
import { compose, withProps, withHandlers } from "recompose";
import {
  withScriptjs,
  withGoogleMap,
  GoogleMap,
  Marker,
} from "react-google-maps";
import { MarkerClusterer } from "react-google-maps/lib/components/addons/MarkerClusterer";
import _ from "lodash"
import { getWaypoints } from "./Axios";

const Maps = compose(
  withProps({
    googleMapURL: "https://maps.googleapis.com/maps/api/js?key=AIzaSyBeaXuqaiDX4tOUKQTrAJJ4nrLAfxVd_6k&v=3.exp&libraries=geometry,drawing,places",
    loadingElement: <div style={{ height: `100%` }} />,
    containerElement: <div style={{ height: `400px` }} />,
    mapElement: <div style={{ height: `100%` }} />,
  }),
  withHandlers({
    onMarkerClustererClick: () => (markerClusterer) => {
      const clickedMarkers = markerClusterer.getMarkers()
    },
  }),
  withScriptjs,
  withGoogleMap
)(props => {
  const [markers, setMarkers] = useState([])

  useEffect(() => {
    getWaypoints(response => {
      setMarkers(response.data)
    })
  }, [])

  console.log(markers);

  return (
  <GoogleMap
    defaultZoom={13}
    defaultCenter={{ lat: -33.436873, lng: -70.6597607 }}
  >
    <MarkerClusterer
      onClick={props.onMarkerClustererClick}
      averageCenter
      enableRetinaIcons
      gridSize={60}
    >
      {_.map(markers, (marker, index) => (
        <Marker
          key={index}
          position={{ lat: marker.gps.lat, lng: marker.gps.long }}
          defaultTitle={marker.identifier}
        />
      ))}
    </MarkerClusterer>
  </GoogleMap>)
}
);

export default Maps;