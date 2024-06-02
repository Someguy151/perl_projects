#!/usr/bin/env perl

# Author: Jonathan Hooper
# Date: Jun 2024
# Course: Power of Perl by Robin Garg

use strict;
use warnings;

my $line_in_a_file = "I am preparing for an interview";
if ($line_in_a_file =~ /INTERVIEW/) {
    print "Found the word: Interview\n";
}

if ($line_in_a_file =~ /INTERVIEW/i) {
    print "Found the word (case insensitive): Interview\n";
}

if ($line_in_a_file =~ s/a/A/) {    # substitute the first occurrence of a with A
    print "$line_in_a_file\n";
}

if ($line_in_a_file =~ s/a/A/g) {    # substitute occurrence of a with A, globally
    print "$line_in_a_file\n";
}

if ($line_in_a_file =~ /\b\w{5}\b/) {    
    print "Word of length 5 matched\n";
}

if ($line_in_a_file =~ /^(\w+)\s*(\w+)/) {
    my $FW = $1;
    my $SW = $2;
    print "FW = $FW and SW = $SW\n";
}

my $input_file = "Inputs/input_file.txt";
my $output_file = "Outputs/output_file.txt";

open(my $output_fh, '>', $output_file) or die "cannot open $output_file for writing: $!\n";
open(my $input_fh, '<', $input_file) or die "cannot open $input_file for reading: $!\n";

while(my $line = <$input_fh>) {
    if ($line =~ /^([a-z]+)$/) {
        print $output_fh $line;
        print "$line\n";
    }
}

close $input_fh;
close $output_fh;
