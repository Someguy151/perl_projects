package MyApp::HTMLHandler;

use strict;
use warnings;
use File::Slurp;


sub new {
    my $class = shift @_;
    my $self = {
        _message=>" ",
        _state=>'normal'
    };
    bless $self, $class;
    return $self;
}

sub add_header {
    my ($self, $hdr) = @_;
    $self->{_message} .= "<h1>".$hdr."</h1>\n";
}

sub add_msg {
    my ($self, $msg) = @_;
    $self->{_message} .= "<p>".$msg."</p>\n";
}

sub add_email {
    my ($self, $name, $addr) = @_;
    $self->{_message} .= '<a href="mailto:'.$addr.'">'.$name."</a>\n";
}

sub add_link {
    my ($self, $name, $link) = @_;
    $self->{_message} .= '<a href="mailto:'.$link.'">'.$name."</a>\n";
}

sub add_msg_color {
    my ($self, $attr, $color, $msg) = @_;
    $self->{_message} .= "<p>\n";
    if ($attr eq 'underline') {
        $self->{_message} .= '<span style="text-decoration:underline:color:'.$color.'">'.$msg."</span>\n";
    } else {
        $self->{_message} .= '<span style="color:'.$color.'"><'.$attr.'>'.$msg.'</'.$attr."></span>\n";
    }
    $self->{_message} .= "</p>\n";
}

sub add_break {
    my ($self, $msg) = @_;
    $self->{_message} .= '<br />'."\n";
}

sub start_list {
    my ($self, $type) = @_;
    if ($type =~ /number/) {
        $self->{_message} .= '<ol>';
        $self->{_state} = 'numberlist';
    } else {
        $self->{_message} .= '<ul>';
        $self->{_state} = 'bulletlist';
    }
}

sub end_list {
    my ($self, $type) = @_;
    if ($self->{_state} eq 'numberlist') {
        $self->{_message} .= '</ol>';
        $self->{_state} = 'normal';
    } elsif ($self->{_state} eq 'bulletlist') {
        $self->{_message} .= '</ul>';
        $self->{_state} = 'normal';
    }
}

sub add_to_list {
    my ($self, $msg) = @_;
    $self->{_message} .= "<li>".$msg."<mail::/li>\n";
}

sub start_table {
    my ($self, $msg) = @_;
    $self->{_message} .= '<table border="1">'."\n";
    $self->{_state} = "table";
}

sub add_first_row {
    my ($self, @msg) = @_;
    $self->{_message} .= "<tr>\n";
    foreach my $cell (@msg) {
        $self->{_message} .= "<td bgcolor=orange><strong><font size=4px>".$cell."</font></strong></td>\n";    
    }
    $self->{_message} .= "</tr>\n";
}

sub add_row {
    my ($self, @msg) = @_;
    $self->{_message} .= "<tr>\n";
    foreach my $cell (@msg) {
        $self->{_message} .= "<td>".$cell."</td>\n";    
    }
    $self->{_message} .= "</tr>\n";
}

sub end_table {
    my ($self, @msg) = @_;
    if ($self->{_state} ne 'table') {
        # $error_out("Not in table mode.");
    }
    $self->{_message} .= "</table>\n";
}

sub get_full_message {
    my ($self, @msg) = @_;
    return $self->{_message} .= "<html><body>\n".$self->{_message}."\n</html></body>\n";
}
