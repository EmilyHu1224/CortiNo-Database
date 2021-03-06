# Sample Usage
## Account Creation
First, create a user:
```
INSERT INTO users (user_id, email, salt, hash)
VALUES ("useruuid1", "wayne.humes@gmail.com", "some_salt", "some_hashed_password");
```

Then populate the secondary demographic information upon user entry:
```
INSERT INTO user_information
VALUES ("useruuid1", "Wayne Humes", "1983", NULL);
```

## Authentication
Retrieve the `user_id`, `salt`, and `hash` to authenticate a login request via email-matching.
```
SELECT user_id, salt, hash
FROM users
WHERE email = "wayne.humes@gmail.com";
```

## User Information Retrieval
Retrieve user information after authentication via `user_id`-matching:
```
SELECT name, birth_year, sex
FROM user_information
WHERE user_id = "useruuid1";
```

## Tag Creation
Create a tag upon user request:
```
INSERT INTO user_tags
VALUES("taguuid1", "useruuid1", "Yoga", NULL);
```

## New Measurement Creation
Create a measurement entity after receiving a result:
```
INSERT INTO measurements (user_id, reading, measurement_id)
VALUES("useruuid1", 14.5, "measurementuuid1");
```

## Measurement User Entry
Upon user request, one or more tags may be attached to each measurement:
```
INSERT INTO measurement_tags
VALUES("taguuid1", "measurementuuid1");
```

Similarly, free-form notes may be entered:
```
INSERT INTO measurement_notes
VALUES("measurementuuid1", "some_user_entered_notes");
```

## Historical Measurement Retrieval
Firstly, the IDs of a user's  historical measurements may be retrieved via `user_id`-matching:
```
SELECT measurement_id
FROM measurements
WHERE measurements.user_id = "useruuid1"
```

The measurement information, including the reading, tags, and notes can then be retrieved via `measurement_id`:
```
SELECT measurements.measurement_id, measurements.reading, user_tags.tag_name, measurements.measured_at, measurement_notes.notes
FROM measurement_tags
INNER JOIN user_tags ON measurement_tags.tag_id = user_tags.tag_id
INNER JOIN measurements ON measurements.measurement_id = measurement_tags.measurement_id
LEFT JOIN measurement_notes ON measurements.measurement_id = measurement_notes.measurement_id
WHERE measurement_tags.measurement_id IN (
    SELECT measurement_id
    FROM measurements
    WHERE measurements.user_id = "useruuid1"
)
ORDER BY measurements.measured_at DESC;
```

It should be noted that when retrieving measurement information in practice, time range should be specified whenever possible. This is because the `measurements` table grows vertically and the amount of historical measurements is unbounded.
