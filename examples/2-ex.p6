#!/usr/bin/env perl6

use lib 'lib';
use Terminal::asciisketch ;

sub MAIN( $width=10, $height=10, $parse="") {
    my $a = Terminal::asciisketch.new(width => $width , height => $height );
    if $parse {
        print $a.parse: $parse ;
    } else {
        $a.p: 12 ;
        $a.goto: 0,0 ;
        for ^10 {
            $a.p: $_;
            $a.l ;
            $a.j ;
        }
        print $a.d ;
        say $a.w ;
    }
}
