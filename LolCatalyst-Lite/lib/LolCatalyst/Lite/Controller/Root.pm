package LolCatalyst::Lite::Controller::Root;
use Moose;
use namespace::autoclean;

BEGIN { extends 'Catalyst::Controller' }

#
# Sets the actions in this controller to be registered with no prefix
# so they function identically to actions created in MyApp.pm
#
__PACKAGE__->config(namespace => '');

=encoding utf-8

=head1 NAME

LolCatalyst::Lite::Controller::Root - Root Controller for LolCatalyst::Lite

=head1 DESCRIPTION

[enter your description here]

=head1 METHODS

=head2 index

The root page (/)

=cut

sub index :Path :Args(0) {
    my ( $self, $c ) = @_;

    # Hello World
#    $c->response->body( $c->welcome_message );
}

=head2 translate

The translate page

=cut

sub translate :Path('translate') {
    my ( $self, $c ) = @_;
    
    my $lol = $c->req->body_params->{lol}; #only for POST reqs

    	#$c->req->params->{lol} catches both POST and GET
	#$c->req->query_params catch only GET params
    $c->stash(
	   lol => $lol,
	   result => $c->model('Translator')->translate($lol),
	   template => 'index.tt',
   );

}


=head2 default

Standard 404 error page

=cut

sub default :Path {
    my ( $self, $c ) = @_;
    $c->response->body( 'Page not found' );
    $c->response->status(404);
}

=head2 end

Attempt to render a view, if needed.

=cut

sub end : ActionClass('RenderView') {
  my ($self, $c) = @_;
  #
  #  my $errors = scalar @{$c->error};
  #  if ($errors) {
  #    $c->res->status(500);
  #    $c->res->body('internal server errorrrr');
  #    $c->clear_errors;
  #  }
}

=head2 translate_service

translate and return a JSON response

=cut

sub translate_service :Path('translate_service') {
  my ($self, $c) = @_;

  $c->authenticate;

  $c->forward('translate');

  # Recall this was created earlier with:  *_create.pl view Service JSON
  $c->stash->{current_view} = 'Service';

}

=head1 AUTHOR

fy,,,

=head1 LICENSE

This library is free software. You can redistribute it and/or modify
it under the same terms as Perl itself.

=cut

__PACKAGE__->meta->make_immutable;

1;
