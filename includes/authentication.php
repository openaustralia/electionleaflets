<?php
// Crude authentication for the admin area

// Check the configuration constants are set
if (ADMIN_USERNAME == 'ADMIN_USERNAME' || ADMIN_PASSWORD == 'ADMIN_PASSWORD') {
  exit('Configuration error');
}

// Check the user has entered a username and password
if (!isset($_SERVER['PHP_AUTH_USER']) || !isset($_SERVER['PHP_AUTH_PW'])) {
    header('WWW-Authenticate: Basic realm="Admin"');
    header('HTTP/1.0 401 Unauthorized');
    exit('Missing username or password');
}

// Check the username and password are correct
if ($_SERVER['PHP_AUTH_USER'] != ADMIN_USERNAME || $_SERVER['PHP_AUTH_PW'] != ADMIN_PASSWORD) {
    header('WWW-Authenticate: Basic realm="Admin"');
    header('HTTP/1.0 401 Unauthorized');
    exit('Unknown username or password');
}
