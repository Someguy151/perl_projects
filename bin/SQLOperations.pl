#!/usr/bin/env perl

# Author: Jonathan Hooper
# Date: Jun 2024
# Course: Power of Perl by Robin Garg

use strict;
use warnings;
use DBI;

=for comment
1. Create a new PostgreSQL user
- createuser --interactive
2. Create a new PostgreSQL database
- createdb mydatabase
=cut

# Database configuration
my $dbname = "mydatabase";
my $host = "localhost";
my $port = "5432";
my $username = "Someguy151";
my $password = "your_password";

# Data Source Name (DSN)
my $dsn = "dbi:Pg:dbname=$dbname;host=$host;port=$port";

# Connect to the database
my $dbh = DBI->connect($dsn, $username, $password, { RaiseError => 1, AutoCommit => 1 })
    or die $DBI::errstr;

print "Connected to the database successfully!\n";

# Create a table
my $create_table_query = <<'SQL';
CREATE TABLE IF NOT EXISTS students (
    id SERIAL PRIMARY KEY,
    name VARCHAR(100),
    type VARCHAR(100),
    courses VARCHAR(100),
    percentage INT
)
SQL

$dbh->do($create_table_query);

# Insert data
my $insert_query = 'INSERT INTO students (name, type, courses, percentage) VALUES (?, ?, ?, ?)';
my $sth = $dbh->prepare($insert_query);
$sth->execute('John Doe', 'Student', 'Power of Perl', 90);
$sth->execute('Jane Smith', 'Student', 'Computer Architecture', 80);
$sth->execute('Bob Boberson', 'Student', 'Digital Design', 85);
$sth->execute('Pat Franks', 'Student', 'Circuit Analysis', 87);

# Retrieve data
my $select_query = 'SELECT id, name, type, courses, percentage FROM students';
$sth = $dbh->prepare($select_query);
$sth->execute();

while (my $row = $sth->fetchrow_hashref) {
    print "ID: $row->{id}, Name: $row->{name}, Type: $row->{type}, Courses: $row->{courses}, Percentage: $row->{percentage}\n";
}

# Disconnect from the database
$dbh->disconnect();

print "Disconnected from the database.\n";
