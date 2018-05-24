#!/usr/bin/env perl6

use lib 'lib';
use Terminal::asciisketch ;

sub MAIN( $width=10, $height=2, $parse="") {
    my $a = Terminal::asciisketch.new(width => $width , height => $height );
    if $parse {
        print $a.parse: $parse ;
    } else {
        $a.parse: "3 10,1,1 h10 11 l" ;
        print $a.d ;
        for ^9 {
            $a.parse: "3 h l 11 l" ;
            print $a.d ;
        }

        say $a.w ;
    }
}
