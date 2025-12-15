<?php
// Direct MySQL connection to add column
$mysqli = new mysqli('localhost', 'root', '', 'sineyma');

if ($mysqli->connect_error) {
    die("Connection failed: " . $mysqli->connect_error);
}

try {
    // Check if column already exists
    $result = $mysqli->query("SHOW COLUMNS FROM users LIKE 'profile_picture'");
    if ($result->num_rows > 0) {
        echo "Column 'profile_picture' already exists in users table.\n";
    } else {
        // Add the column
        $sql = 'ALTER TABLE users ADD COLUMN profile_picture VARCHAR(255) NULL AFTER session_token';
        if ($mysqli->query($sql)) {
            echo "Successfully added 'profile_picture' column to users table.\n";
        } else {
            echo "Error adding column: " . $mysqli->error . "\n";
        }
    }
} catch (Exception $e) {
    echo "Error: " . $e->getMessage() . "\n";
}

$mysqli->close();
