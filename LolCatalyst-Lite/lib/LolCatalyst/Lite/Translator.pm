package LolCatalyst::Lite::Translator;

use Moose;
use Module::Pluggable::Object;
use namespace::clean -excep => 'meta';

has 'default_target' => (
  is => 'ro', isa => 'Str', required => 1, default => 'LOLCAT'
);


has '_translators' => (
  is => 'ro', isa => 'HashRef', lazy_build => 1
);

sub _build__translators {
  my ($self) = @_;
  my $base = __PACKAGE__;

  my $mp = Module::Pluggable::Object->new(
    search_path => [ $base ]
  );

  my @classes = $mp->plugins;

  my %translators;
  foreach my $class (@classes) {

    # Class::MOP is the core metaobject protocol that moose is built on top of,
    # it provides some handy functions. load_class will work out what to
    # require() to get the class loaded...  
    #
    # !!!! Note !!!! In the original book it was shown as
    # 'Class::MOP::load_class' but aparently MOP has been deprecated! It is now
    # Class::Load::load_class instead.....
    Class::Load::load_class($class); 

    # We copy here the class to name and then strip the base off the front of
    # the copy in $name. The \Q...\E says that if any regex special chars appear
    # in the stuff between them, those chars should be ignored (it uses
    # perldoc -f quotemeta on the demilited chunk basically). This leaves the
    # $name containing LOLCAT for a $class value of
    # LolCatalyst::Lite::Translator::LOLCAT
    (my $name = $class) =~ s/^\Q${base}::\E//;

    $translators{$name} = $class->new;
  }

  return \%translators;
}

sub translate {
  my ($self, $text) = @_;
  $self->translate_to($self->default_target, $text);
}

sub translate_to {
  my ($self, $target, $text) = @_;
  $self->_translators->{$target}->translate($text);
}

__PACKAGE__->meta->make_immutable;

1;
