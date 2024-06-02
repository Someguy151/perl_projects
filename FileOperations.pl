#!/usr/bin/env perl

# Author: Jonathan Hooper
# Date: Jun 2024
# Course: Power of Perl by Robin Garg

use strict;
use warnings;
use Getopt::Long;


my $input_file;
GetOptions("input|i=s"=>\$input_file);

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
my $output_file = "Outputs/FileOutput.txt";
open (my $output_fh, '>', $output_file) or die "Cannot open $output_file for writing \n";
print $output_fh @input_file_details;
close $output_fh;

# Example of appending to a file
my $output_file = "Outputs/FileOutput.txt";
open (my $output_fh, '>>', $output_file) or die "Cannot open $output_file for appending \n";
print $output_fh @input_file_details;
close $output_fh;
