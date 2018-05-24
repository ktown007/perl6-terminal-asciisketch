#!/usr/bin/env perl6

use lib 'lib';
use Terminal::asciisketch ;

sub MAIN( $width=10, $height=10, $parse="") {
    my $a = Terminal::asciisketch.new(width => $width , height => $height );

    if $parse {
        print $a.parse: $parse ;
    } else {

        $a.p: 1 ;
        $a.goto: 4,3,0 ;
        $a.parse: "h2 k2 l2 j2" ;
        $a.goto: 7,3,0 ;
        $a.parse: "l l k k h h j j" ;
        $a.goto: 4,7,0 ;
        $a.parse: "h h k k l l j j" ;
        $a.goto: 7,7,0 ;
        $a.parse: "l l k k h h j j" ;
        $a.goto: 5,5,0 ;
        $a.parse: "6 l l k k h h j j" ;

        $a.p: 80 ;
        $a.goto: 3,2,1 ;
        $a.p: 54 ;
        $a.goto: 8,2,1 ;
        $a.p: 10 ;
        $a.goto: 6,4,1 ;

        print $a.d ;

        say $a.w ;
        #1 4,3,0 h h k k l l j j 7,3,0 l l k k h h j j 4,7,0 h h k k l l j j 7,7,0 l l k k h h j j 5,5,0 6 l l k k h h j j 80 3,2,1 54 8,2,1 10 6,4,1 d
        #say $a.data ;
    }
}
