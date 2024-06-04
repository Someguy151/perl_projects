package MyApp::FileOperations;

use strict;
use warnings;
use File::Slurp;

sub process_files {
    my ($input_file, $output_file) = @_;

    # Read from input file
    my @lines = read_file($input_file);

    # Process lines
    # ...

    # Write to output file
    write_file($output_file, @lines);
}

1;  # End of MyApp::FileOperations
