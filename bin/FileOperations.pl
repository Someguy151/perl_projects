#!/usr/bin/env perl

use strict;
use warnings;
use FindBin;
use lib "$FindBin::Bin/../lib";
use MyApp::FileOperations;

# Determine base directory
my $base_dir = "$FindBin::Bin/..";

# Paths
my $input_file = "$base_dir/data/input_file.txt";
my $output_file = "$base_dir/Outputs/output_file.txt";

# Use the module to perform file operations
MyApp::FileOperations::process_files($input_file, $output_file);

# GetOptions("input|i=s"=>\$input_file);

# Example of reading a file
my @input_file_details;
if (-e $input_file) {
    open (my $input_fh, '<', $input_file) or die "Cannot open $input_file for reading\n";
    @input_file_details = <$input_fh>;

    close $input_fh;
} else {
    print "$input_file deos not exist, check the file path.\n";
    exit
}

# print "@input_file_details";

foreach (@input_file_details) {
    print "$_";
}

# Example of writing to a file
open (my $output_fh, '>', $output_file) or die "Cannot open $output_file for writing \n";
print $output_fh @input_file_details;
close $output_fh;

# Example of appending to a file
open ($output_fh, '>>', $output_file) or die "Cannot open $output_file for appending \n";
print $output_fh @input_file_details;
close $output_fh;
