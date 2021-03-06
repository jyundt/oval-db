CREATE DATABASE oval_original_schema OWNER postgres;
\connect oval_original_schema

CREATE TABLE official (
  official_id SERIAL PRIMARY KEY,
  official_name VARCHAR(200) NOT NULL
);

CREATE TABLE marshal (
  marshal_id SERIAL PRIMARY KEY,
  marshal_name VARCHAR(200) NOT NULL
);


CREATE TABLE race_class (
  race_class_id SERIAL PRIMARY KEY,
  race_class_description VARCHAR(200) NOT NULL
);

CREATE TABLE racer (
  racer_id SERIAL PRIMARY KEY,
  racer_name VARCHAR(200) NOT NULL,
  racer_usac_license INT,
  racer_birthdate DATE
);


CREATE TABLE team (
  team_id SERIAL PRIMARY KEY,
  team_name VARCHAR(200) NOT NULL
);

CREATE TABLE race (
  race_id SERIAL PRIMARY KEY,
  race_date DATE NOT NULL,
  race_class_id INT REFERENCES race_class,
  race_duration INTERVAL,
  race_slow_lap INTERVAL,
  race_fast_lap INTERVAL,
  race_average_lap INTERVAL,
  race_weather VARCHAR(200),
  race_usac_permit VARCHAR(200),
  race_laps INT
);

CREATE TABLE participant (
  participant_id SERIAL PRIMARY KEY,
  racer_id INT REFERENCES racer,
  team_id INT REFERENCES team,
  race_id INT REFERENCES race
);

CREATE TABLE race_official (
  race_official_id SERIAL PRIMARY KEY,
  official_id INT REFERENCES official,
  race_id INT REFERENCES race
);

CREATE TABLE race_marshal (
  race_marshal SERIAL PRIMARY KEY,
  marshal_id INT REFERENCES marshal ,
  race_id INT REFERENCES race
);

CREATE TABLE prime (
  prime_id SERIAL PRIMARY KEY,
  participant_id INT REFERENCES participant,
  prime_description VARCHAR(200) NOT NULL
);

CREATE TABLE result (
  result_id SERIAL PRIMARY KEY,
  participant_id INT REFERENCES participant,
  result_place INT,
  result_points INT,
  result_team_points INT,
  result_mar_place INT,
  result_mar_points INT,
  result_point_prime BOOL,
  result_dnf BOOL,
  result_dns BOOL,
  results_relegated BOOL,
  results_disqualified BOOL
);

