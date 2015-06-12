package LolCatalyst::Lite::Translator::Scramble;
use Moose;

=head1 NAME

Scramble - tset the budnos of lieibiglty and dstraneotme how we pcvreiee wdors wtih yuor Ctyslaat apicapltion

=head1 VERSION

Version 0.03

=cut

our $VERSION = '0.03';

=head1 SYNOPSIS

=cut

sub _scramble_block {
    my $text = shift;

    ${$text} =~ s{
                  ( (?:(?<=[^[:alpha:]])|(?<=\A))
                    (?<!&)(?-x)(?<!&#)(?x)
                    (?:
                       ['[:alpha:]]+ | (?<!-)-(?!-)
                     )+
                    (?=[^[:alpha:]]|\z)
                   )
                  }
                 {_scramble_word($1)}gex;
}

sub _scramble_word {
    my $word = shift || return '';
    my @piece = split //, $word;
    shuffle(@piece[1..$#piece-1])
        if @piece > 2;
    join('', @piece);
}

sub shuffle {
    for ( my $i = @_; --$i; ) {
        my $j = int(rand($i+1));
        @_[$i,$j] = @_[$j,$i];
    }
}

sub translate {
  my ($self, $text) = @_;
  _scramble_block(\$text);
  return $text;
}

1; # End of Catalyst::Plugin::Acme::Scramble
