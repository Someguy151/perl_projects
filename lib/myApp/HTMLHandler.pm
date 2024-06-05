package MyApp::HTMLHandler;

use strict;
use warnings;

sub new {
    my $class = shift;
    my $self = {
        _message => "",
        _state => 'normal',
    };
    bless $self, $class;
    return $self;
}

sub add_header {
    my ($self, $hdr) = @_;
    $self->{_message} .= "<h1>" . _escape_html($hdr) . "</h1>\n";
}

sub add_msg {
    my ($self, $msg) = @_;
    $self->{_message} .= "<p>" . _escape_html($msg) . "</p>\n";
}

sub add_email {
    my ($self, $name, $addr) = @_;
    $self->{_message} .= '<a href="mailto:' . _escape_html($addr) . '">' . _escape_html($name) . "</a>\n";
}

sub add_link {
    my ($self, $name, $link) = @_;
    $self->{_message} .= '<a href="' . _escape_html($link) . '">' . _escape_html($name) . "</a>\n";
}

sub add_msg_color {
    my ($self, $attr, $color, $msg) = @_;
    my %valid_attrs = map { $_ => 1 } qw(b i u del small);
    if ($attr eq 'underline') {
        $attr = 'u'; # Translate 'underline' to 'u'
    }
    if (!$valid_attrs{$attr}) {
        die "Invalid attribute: $attr";
    }
    $self->{_message} .= "<p><span style=\"color:$color\"><$attr>" . _escape_html($msg) . "</$attr></span></p>\n";
}

sub add_break {
    my $self = shift;
    $self->{_message} .= '<br />' . "\n";
}

sub start_list {
    my ($self, $type) = @_;
    if ($type eq 'numbered') {
        $self->{_message} .= '<ol>';
        $self->{_state} = 'numberlist';
    } else {
        $self->{_message} .= '<ul>';
        $self->{_state} = 'bulletlist';
    }
}

sub end_list {
    my $self = shift;
    if ($self->{_state} eq 'numberlist') {
        $self->{_message} .= '</ol>';
    } elsif ($self->{_state} eq 'bulletlist') {
        $self->{_message} .= '</ul>';
    }
    $self->{_state} = 'normal';
}

sub add_to_list {
    my ($self, $msg) = @_;
    $self->{_message} .= "<li>" . _escape_html($msg) . "</li>\n";
}

sub start_table {
    my $self = shift;
    $self->{_message} .= '<table border="1">' . "\n";
    $self->{_state} = "table";
}

sub add_row {
    my ($self, @cells) = @_;
    $self->{_message} .= "<tr>\n";
    foreach my $cell (@cells) {
        $self->{_message} .= "<td>" . _escape_html($cell) . "</td>\n";
    }
    $self->{_message} .= "</tr>\n";
}

sub end_table {
    my $self = shift;
    $self->{_message} .= "</table>\n" if $self->{_state} eq 'table';
    $self->{_state} = 'normal';
}

sub get_full_message {
    my $self = shift;
    return "<html><body>\n" . $self->{_message} . "\n</body></html>\n";
}

sub _escape_html {
    my $text = shift;
    $text =~ s/&/&amp;/g;
    $text =~ s/</&lt;/g;
    $text =~ s/>/&gt;/g;
    $text =~ s/"/&quot;/g;
    $text =~ s/'/&#39;/g;
    return $text;
}

1;  # End of MyApp::HTMLHandler
