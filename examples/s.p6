#!/usr/bin/env perl6

use lib 'lib';
use Terminal::asciisketch ;

my $a = Terminal::asciisketch.new(width => 10 , height => 3 );

print $a.parse: "3 10,1,1 h10 11 l d" ;


