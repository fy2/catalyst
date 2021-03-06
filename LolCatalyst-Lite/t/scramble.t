use strict;
use warnings;

use Test::More qw(no_plan);
use LolCatalyst::Lite::Translator;

ok( 
  (my $tr = LolCatalyst::Lite::Translator->new),
  'Translator constructed'
);

my $input = 'hello world';
my $scrambled = $tr->translate_to('Scramble', $input);

like($scrambled, qr/h...o w...d/, 'text matches first and last');
# isnt($scrambled, $input, 'text was altered'); this test fails sometimes as it
# is wrong logic...
