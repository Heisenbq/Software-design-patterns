CREATE TABLE IF NOT EXISTS student (
  id SERIAL PRIMARY KEY,
  first_name VARCHAR(40) NOT NULL,
  surname VARCHAR(40) NOT NULL,
  last_name VARCHAR(40) NOT NULL,
  email VARCHAR(40),
  telegram VARCHAR(40),
  phone VARCHAR(40),
  git VARCHAR(40),
  dob DATE
);