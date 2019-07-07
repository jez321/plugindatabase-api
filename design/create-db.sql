CREATE DATABASE plugin_database;

\c plugin_database 

CREATE TABLE link (
  id_link SERIAL PRIMARY KEY,
  title TEXT,
  url TEXT,
  created TIMESTAMPTZ,
  updated TIMESTAMPTZ
);

CREATE TABLE company (
  id_company SERIAL PRIMARY KEY,
  name TEXT NOT NULL,
  url TEXT NOT NULL,
  created TIMESTAMPTZ NOT NULL,
  updated TIMESTAMPTZ NOT NULL
);

CREATE TABLE plugin (
  id_plugin SERIAL PRIMARY KEY,
  id_company INTEGER,
  created TIMESTAMPTZ,
  updated TIMESTAMPTZ
);

CREATE TABLE plugin_link (
  id_plugin INTEGER,
  id_link INTEGER,
  created TIMESTAMPTZ,
  updated TIMESTAMPTZ,
  PRIMARY KEY (id_plugin, id_link)
);

CREATE TABLE category (
  id_category SERIAL PRIMARY KEY,
  name TEXT,
  created TIMESTAMPTZ,
  updated TIMESTAMPTZ
);

CREATE TABLE plugin_category (
  id_plugin INTEGER,
  id_category INTEGER,
  created TIMESTAMPTZ,
  updated TIMESTAMPTZ,
  PRIMARY KEY (id_plugin, id_category)
);

CREATE TABLE deal (
  id_deal SERIAL PRIMARY KEY,
  id_link INTEGER,
  description TEXT,
  price NUMERIC(8,2),
  start_date TIMESTAMPTZ,
  end_date TIMESTAMPTZ,
  created TIMESTAMPTZ,
  updated TIMESTAMPTZ
);