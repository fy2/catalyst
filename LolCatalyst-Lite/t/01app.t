#!/usr/bin/env perl
use strict;
use warnings;
use Test::More qw(no_plan);

##use Catalyst::Test 'LolCatalyst::Lite';
#
#ok( request('/')->is_success, 'Request should succeed' );
#
#done_testing();

BEGIN { use_ok 'Catalyst::Test', 'LolCatalyst::Lite'}
use HTTP::Headers;
use HTTP::Request::Common;

# GET request

my $request = GET('http://localhost');
my $response = request($request);

ok($response = request($request), 'Basic request to start page');
ok($response->is_success, 'start page request successful 2xx');

is($response->content_type, 'text/html', 'HTML content-type');

like($response->content, qr/Translate/, 'contains the word translate');

$request = POST(
  'http://localhost/translate',
  'Content-Type' => 'form-data',
  'Content' => [
    'lol' => 'Can I have a cheese burger?',
  ]);

$response = undef;

ok($response = request($request), 'Request to return translation');

ok($response->is_success, 'Translation is success');

is($response->content_type, 'text/html', 'HTML content type');
like($response->content, qr/CHE{1,3}Z/, 'contains CHE{1,3}Z in it');


$request = POST(
  'http://localhost/translate_service',
  'Content-Type' => 'form-data',
  'Content' => [
    'lol' => 'Can I have a cheese burger?',
  ]);

$response = undef;

ok($response = request($request), 'Request to return JSON');

ok($response->is_success, 'Translation is success');

is($response->content_type, 'application/json', 'JSON content type');
like($response->content, qr/CHE{1,3}Z/, 'contains CHE{1,3}Z in it');
