package LolCatalyst::Lite::Translator;

use Moose;
use namespace::clean -excep => 'meta';

has 'default_target' => (
  is => 'ro', isa => 'Str', required => 1, default => 'LOLCAT'
);


has 'translators' => (
  is => 'ro', isa => 'HashRef', lazy_build => 1
);

sub _build_translators {
  my ($self) = @_;
  return { LOLCAT => LolCatalyst::Lite::Translator::LOLCAT->new};
}

sub translate {
  my ($self, $text) = @_;
  $self->translate_to($self->default_target, $text);
}

sub translate_to {
  my ($self, $target, $text) = @_;
  $self->translators->{$target}->translate($text);
}


package LolCatalyst::Lite::Translator::LOLCAT;
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
