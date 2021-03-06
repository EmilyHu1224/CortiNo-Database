SELECT user_id, salt, hash
FROM users
WHERE email = "wayne.humes@gmail.com";

SELECT name, birth_year, sex
FROM user_information
WHERE user_id = "useruuid1";

SELECT measurement_id, reading, measured_at
FROM measurements
WHERE user_id = "useruuid1"
ORDER BY measured_at DESC;

SELECT measurement_id
FROM measurements
WHERE measurements.user_id = "useruuid1";

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
