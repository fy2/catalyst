use strict;
use warnings;
use Test::More qw(no_plan);
use LolCatalyst::Lite::Translator;

ok(
  (my $tr = LolCatalyst::Lite::Translator->new),
  'Constructed Translator Object'
);

like(
  $tr->translate('Can I have a cheese burger?'),
  qr/CHE{1,3}Z/,
  'String translated'
);
