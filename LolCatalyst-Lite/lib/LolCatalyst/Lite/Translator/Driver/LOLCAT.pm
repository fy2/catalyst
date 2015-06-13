package LolCatalyst::Lite::Translator::Driver::LOLCAT;
use Moose;
use namespace::autoclean;
use Acme::LOLCAT ();

extends 'Catalyst::Model';

=head1 NAME

LolCatalyst::Lite::Translator - Catalyst Model

=head1 DESCRIPTION

Catalyst Model.

=head2 translate

translate a text into lolcat language

=cut

sub translate {
  my ($self, $text) = @_;

  return Acme::LOLCAT::translate($text);
}

=encoding utf8

=head1 AUTHOR

fy,,,

=head1 LICENSE

This library is free software. You can redistribute it and/or modify
it under the same terms as Perl itself.

=cut

__PACKAGE__->meta->make_immutable;

1;
