import axios from "axios"

export const getWaypoints = callback => {
  var promise = axios({
    method: "get",
    url: "/api/v1/gps"
  });
  promise
    .then(response => {
      callback(response);
    })
    .catch(err => {
      callback(err.response);
    });
};