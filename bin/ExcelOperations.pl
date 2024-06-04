#!/usr/bin/env perl

# Author: Jonathan Hooper
# Date: Jun 2024
# Course: Power of Perl by Robin Garg

use strict;
use warnings;
use Getopt::Long;
use FindBin;
use lib "$FindBin::Bin/../lib";

use Spreadsheet::WriteExcel;
use Spreadsheet::ParseExcel;

# Determine base directory
my $base_dir = "$FindBin::Bin/..";

# Writing to Excel
# Note: You can not do both read and write operations at the same time
#       Finish one operation (read XOR write) before starting another.
my $output_xls = "$base_dir/Outputs/output_xls.xls";
my $workbook = Spreadsheet::WriteExcel->new($output_xls) or die "Cannot create workbook: $!";

print "Processing $output_xls for writing\n";

my $sheet1 = $workbook->add_worksheet("Example sheet 1");
my $sheet2 = $workbook->add_worksheet("Example sheet 2");

$sheet1->write(0, 0, "0");
$sheet1->write(0, 1, "1");
$sheet1->write(1, 0, "2");
$sheet1->write(1, 1, "3");

$sheet2->write(0, 0, "0");
$sheet2->write(0, 1, "1");
$sheet2->write(1, 0, "2");
$sheet2->write(1, 1, "3");

$workbook->close();

# Reading from Excel
print "Processing $output_xls for reading\n";

my $parser = Spreadsheet::ParseExcel->new();
my $excel = $parser->parse($output_xls);

if (!defined $excel) {
    die "Parsing error: ", $parser->error(), ".\n";
}

foreach my $sheet ($excel->worksheets()) {
    my ($row_min, $row_max) = $sheet->row_range();
    my ($col_min, $col_max) = $sheet->col_range();

    for my $row ($row_min .. $row_max) {
        for my $col ($col_min .. $col_max) {
            my $cell = $sheet->get_cell($row, $col);
            next unless $cell;
            print "Row: $row, Col: $col, Value: ", $cell->value(), "\n";
        }
    }
}
