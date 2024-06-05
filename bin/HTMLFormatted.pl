#!/usr/bin/env perl

use strict;
use warnings;
use FindBin;
use lib "$FindBin::Bin/../lib";
use MyApp::HTMLHandler;
use Getopt::Long;

# Determine base directory
my $base_dir = "$FindBin::Bin/..";

# Command-line options
my $output_html = "$base_dir/Outputs/output_html.html";
GetOptions("output=s" => \$output_html) or die "Error in command-line arguments\n";

# Create HTMLHandler object
my $msg = MyApp::HTMLHandler->new();

# Add content
eval {
    $msg->add_header("Test");
    $msg->add_msg("Simple test here.");
    $msg->add_msg_color("b", "red", "Bold text in red.");
    $msg->add_msg_color("i", "black", "Italic text in black.");
    $msg->add_msg_color("del", "cyan", "Strikethrough text in cyan.");
    $msg->add_msg_color("small", "blue", "Small text in blue.");
    $msg->add_msg_color("underline", "green", "Underlined text in green.");

    $msg->add_break();

    $msg->start_list("numbered");
    $msg->add_to_list("item 1");
    $msg->add_to_list("item 2");
    $msg->end_list();

    $msg->start_list("bulleted");
    $msg->add_to_list("item 1");
    $msg->add_to_list("item 2");
    $msg->end_list();

    $msg->start_table();
    $msg->add_row("Head1", "Head2");
    $msg->add_row("one", "two");
    $msg->end_table();

    $msg->add_email("Email me at: ", "jonathan.hooper@ XYZ.com");
    $msg->add_break();  # Add a break between the email link and the next link
    $msg->add_link("Just duck it: ", "https://start.duckduckgo.com/");
};
if ($@) {
    die "An error occurred while generating the HTML content: $@\n";
}

# Write to file
open(my $output_fh, '>', $output_html) or die "Cannot open $output_html for writing: $!\n";
print $output_fh $msg->get_full_message();
close $output_fh;

print "HTML file generated successfully: $output_html\n";
