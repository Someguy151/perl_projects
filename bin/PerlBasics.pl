#!/usr/bin/env perl

# Author: Jonathan Hooper
# Date: May 2024
# Course: Power of Perl by Robin Garg

use strict;
use warnings;

=for comment
# Scalars
my $scalar_var1 = 1;
my $scalar_var2 = 0x15;
my $scalar_var3 = "A";
my $scalar_var4 = "Hello";
print "$scalar_var1\n$scalar_var2\n$scalar_var3\n$scalar_var4\n";
=cut

=for comment
# Arrays
my @array_numbers = (1,2,3...10);
my @array_strings = ("Table", "Chair", "Sofa");
my @array_strings2 = (@array_strings, "Bed");
my @array_qw = qw(This is an Example);    # qw = quoted words
print "@array_numbers[1]\n";
print "@array_numbers[-1]\n";
print "@array_qw[2]\n";
print "@array_strings2\n";

shift @array_numbers;                     # removes an item from the front
print "@array_numbers\n";

unshift @array_numbers, "Add";            # adds an item to the front
print "@array_numbers\n";

push @array_numbers, "End";               # adds an item to the end
print "@array_numbers\n";

pop @array_numbers;                       # removes an item from the end
print "@array_numbers\n";
=cut

=for comment
# Hashes
my %hash_example = (
    key1 => "value1", 
    key2 => "value2", 
    key3 => "value3"
);
print "$hash_example{key1}\n";

$hash_example{key2} = "NewValue2";
print "$hash_example{key2}\n";
=cut

=for comment
# Operators
my $var1 = "AB";
my $var2 = "CD";

my $var3 = $var1 . $var2;
print "Concatenation: $var3\n";

$var1 .= " ";      # equivalent to $var1 = $var1 . " "
$var1 = $var1 x 10; # correct syntax for repetition
print "Repetition: $var1\n";

my $var = "this is an example";
my @array_example = split(/ /, $var);
print "Split example: $array_example[-1]\n";

my @sorted_array = sort @array_example;
my @reversed_sorted_array = reverse sort @array_example;
print "Sorted array: @sorted_array\nReversed sorted array: @reversed_sorted_array\n";
=cut

=for comment
# Loops
print "\nFor loop using C like syntax: \n\n";
for (my $i = 0; $i <= 10; $i++) {
    print "$i\n";
}

print "\nFor loop using foreach syntax: \n\n";
foreach my $i (0..10) {
    print "$i\n";
}

print "\nFor loop using underscore syntax: \n\n";
foreach $_ (0..10) {
    print "$_\n";
}

print "\nFor loop on a hash: \n\n";
my %hash = (Key1 => "Value1", Key2 => "Value2", Key3 => "Value3");
foreach my $key(keys %hash) {
    print "The $key is $hash{$key}\n";
}

print "\nFor loop on a hash with underscore syntax: \n\n";
my %hash = (Key1 => "Value1", Key2 => "Value2", Key3 => "Value3");
foreach $_ (keys %hash) {
    print "The $_ is $hash{$_}\n";
}

=cut

=for comment
# Conditional Statements
my $a = 5;
my $b = 6;
if ($a > $b) {
    print "A is greater than B";
} elsif ($a < $b) {
    print "A is less than B";
} else {
    print "A is equal to B";  # braces are not required for single lines
}
=cut

# =for comment
# Subroutines
my $sub_value = &factorial(7);
print "$sub_value";

sub factorial {
    my ($n) = @_;
    if ($n <= 2) {
        return $n;
    } else {
        $n * factorial($n-1);
    }
}
# =cut