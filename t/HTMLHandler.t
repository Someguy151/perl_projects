#!/usr/bin/env perl

use strict;
use warnings;
use Test::More;
use FindBin;
use lib "$FindBin::Bin/../lib";
use MyApp::HTMLHandler;

# Create a new HTMLHandler object
my $handler = MyApp::HTMLHandler->new();

# Test 1: Add header
$handler->add_header('Test Header');
like($handler->get_full_message(), qr/<h1>Test Header<\/h1>/, 'Header added successfully');

done_testing();
