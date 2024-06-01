#!/usr/bin/env perl

# Author: Jonathan Hooper

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

# =for comment
# Hashes
my %hash_example = (
    key1 => "value1", 
    key2 => "value2", 
    key3 => "value3"
);
print "$hash_example{key1}\n";

$hash_example{key2} = "NewValue2";
print "$hash_example{key2}\n";
# =cut