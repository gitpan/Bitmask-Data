# -*- perl -*-

# t/long.t - bitmasks with 100 bits

use Test::More;
use Test::NoWarnings;

use lib qw(t/lib);

use strict;
use warnings;


plan tests => 9;    
        
use_ok( 'Testmask6' );
        
my $tm1 = Testmask6->new('value100');
is($tm1->string,'1000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000');

my $tm2 = Testmask6->new('value1');
is($tm2->string,'0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001');

$tm1->add($tm2);
is($tm1->string,'1000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001');

$tm1 += '0b0000010';
is($tm1->string,'1000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000011');

my $integer = $tm1->integer;
isa_ok($integer,'Math::BigInt');
is($integer->as_int,'633825300114114700748351602691');

my $tm3 = Testmask6->new($integer);
is($tm3->string,$tm1->string);