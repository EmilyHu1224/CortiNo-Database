INSERT INTO users (user_id, email, salt, hash)
VALUES ("useruuid1", "wayne.humes@gmail.com", "some_salt", "some_hashed_password");
INSERT INTO user_information
VALUES ("useruuid1", "Wayne Humes", "1983", NULL);

INSERT INTO users (user_id, email, salt, hash)
VALUES ("useruuid2", "brenda.arnold@gmail.com", "some_salt", "some_hashed_password");
INSERT INTO user_information
VALUES ("useruuid2", "Brenda Arnold", "1969", NULL);

INSERT INTO user_tags
VALUES("taguuid1", "useruuid1", "Yoga", NULL);
INSERT INTO user_tags
VALUES("taguuid2", "useruuid1", "Jogging", NULL);
INSERT INTO user_tags
VALUES("taguuid3", "useruuid2", "Hiking", NULL);
INSERT INTO user_tags
VALUES("taguuid4", "useruuid2", "Pilates", NULL);

INSERT INTO measurements (user_id, reading, measurement_id)
VALUES("useruuid1", 14.5, "measurementuuid1");
INSERT INTO measurement_tags
VALUES("taguuid1", "measurementuuid1");
INSERT INTO measurement_tags
VALUES("taguuid2", "measurementuuid1");
INSERT INTO measurement_notes
VALUES("measurementuuid1", "some_user_entered_notes");

INSERT INTO measurements (user_id, reading, measurement_id)
VALUES("useruuid1", 16.3, "measurementuuid2");
INSERT INTO measurement_tags
VALUES("taguuid2", "measurementuuid2");

INSERT INTO measurements (user_id, reading, measurement_id)
VALUES("useruuid2", 14.5, "measurementuuid3");
INSERT INTO measurement_tags
VALUES("taguuid3", "measurementuuid3");

INSERT INTO measurements (user_id, reading, measurement_id)
VALUES("useruuid2", 16.3, "measurementuuid4");
INSERT INTO measurement_tags
VALUES("taguuid4", "measurementuuid4");