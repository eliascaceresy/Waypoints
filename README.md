# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

- Ruby version 3.0.2
- Rails version 6.1.4

- Redis

- rails db:create db:migrate for database.

- rails s for run server

- API for gps waypoints

  - post localhsot:3000/api/v1/gps
  - paramters:

    {
    "latitude": 20.23,
    "longitude": -0.56,
    "sent_at": 2016-06-02 20:45:00",
    "vehicle_identifier": "HA-3452"
    }

- For run test rspec
