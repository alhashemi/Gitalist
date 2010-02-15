package Gitalist::View::Pod2Html;
use Moose;
use namespace::autoclean;

extends 'Catalyst::View';

use Pod::HtmlEasy;

use HTML::Entities qw(encode_entities);

sub process {
    my($self, $c) = @_;

    $c->res->body($self->render($c, $c->res->body, $c->stash));
}

sub render {
    my ($self, $c, $blob, $args) = @_;
    
    my $lang = $args->{language};

    my $ret;
    if($lang) {
        # $lang is set: mixed code and pod
        $ret = eval {

        };
        warn $@ if $@;
    }
    else {
        # pure pod (maybe?)
	my $encoded = encode_entities($blob);
	open my $fh, \$encoded;
	$ret = Pod::HtmlEasy->new->pod2html($fh);
    }

    return $ret;
}

__PACKAGE__->meta->make_immutable;

__END__

=head1 NAME

Gitalist::View::Pod2Html - Responsible for converting POD to HTML

=head1 DESCRIPTION

Catalyst View for POD HTMLification.

=head1 METHODS

=head2 process

=head2 render

=head1 AUTHORS

See L<Gitalist> for authors.

=head1 LICENSE

See L<Gitalist> for the license.

=cut
