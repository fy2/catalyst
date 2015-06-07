package LolCatalyst::Lite::Model::Auth;

use strict;
use base 'Catalyst::Model::DBIC::Schema';

__PACKAGE__->config(
    schema_class => 'LolCatalyst::Lite::Auth::Schema',
    
    
);

=head1 NAME

LolCatalyst::Lite::Model::Auth - Catalyst DBIC Schema Model

=head1 SYNOPSIS

See L<LolCatalyst::Lite>

=head1 DESCRIPTION

L<Catalyst::Model::DBIC::Schema> Model using schema L<LolCatalyst::Lite::Auth::Schema>

=head1 GENERATED BY

Catalyst::Helper::Model::DBIC::Schema - 0.65

=head1 AUTHOR

fy

=head1 LICENSE

This library is free software, you can redistribute it and/or modify
it under the same terms as Perl itself.

=cut

1;
