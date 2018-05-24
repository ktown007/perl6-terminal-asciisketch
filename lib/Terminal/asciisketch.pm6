use v6 ;

unit class Terminal::asciisketch ;

has $.width ;
has $.height ;
has $.x is rw = 0 ;
has $.y is rw = 0 ;
has $.p is rw = 6 ;
has $.pd is rw = True ;
has @.data; 
has @.hist; 

my @grey =  ".:~=+*#%@".split('') ;
#          "0123456789" ;
@grey[0] = " " ;
@grey[10] = "🙂" ;
@grey[11] = "⛵" ;
@grey[12] = "🏂" ;

for 32..126 {
    @grey[$_] = $_.chr ;
}
submethod TWEAK() {
    for flat ^$!height X ^$!width -> $y, $x {
        @!data[$y][$x] = " " ;
    }
}

method shake { # reset screen
    for flat ^self.height X ^self.width -> $y, $x {
        @!data[$y][$x] = " " ;
    }
}
method plot { # dram a chacter in the current location
    #say "x  ", $!x ," y ", $!y, " p " , $!p ;
    @!data[$!y][$!x] = @grey[$!p] if $!pd ;
    return "" ;
}
#method goto( Int $x where ^$!width, Int $y where ^$!height, $plot=1) {
method goto( $x, $y , $plot=1) { # teleport to location with pen up override
    $!x = $x ; 
    $!y = $y ;
    self.plot() if so $plot == 1 ;
    @.hist.push: "$x,$y,$plot"  ;
    return "" ;
}
method pc( $p , $c) { #0-9 greyscale add a new character to the map
    #$a.pc: 15, "F" ;
    @grey[$p] = $c ; 
}
method p($c){  # set the current pen colour
    @.hist.push: $c ;
    $!p= $c ;
}
method u {  # toggle pen up pen down
    @.hist.push: "u" ;
    self.pd = !self.pd ;
    return "" ;
}
method d { # draw the picture
    #print "\033[2J" ;
    #print "\033c" ;
    my $picture ;
    for ^self.height -> $y {
        $picture ~= @!data[$y].join("") ~ "\n" ;
    }
    @.hist.push: 'd' ;
    return $picture ;
}
method l($i=1){ # thing vi, move right
    for ^$i {
        $!x += 1 if $!x < $!width  ;
        self.plot() ;
    }
    @.hist.push: $i>1 ?? "l"~$i !! "l" ;
    return "" ;
}
method h($i=1){ # think vi move left
    for ^$i {
        $!x -= 1 if $!x > 0;
        self.plot() ;
    }
    @.hist.push: $i>1 ?? "h"~$i !! "h" ;
    return "" ;
}
method j($i=1){ # think vi move down
    for ^$i {
        $!y += 1 if $!y < $!height ;
        self.plot() ;
    }
    @.hist.push: $i>1 ?? "j"~$i !! "j" ;
    return "" ;
}
method k($i=1){ # this vi move up
    for ^$i {
        $!y -= 1 if $!y > 0;
        self.plot() ;
    }
    @.hist.push: $i>1 ?? "k"~$i !! "k" ;
    return "" ;
}
method w { # write history
    return @!hist.join: " " ;
}
method parse($commands){ # parse a string of commands hmmm this could be a grammar...
    my $output ;
    for $commands.split(" ") -> $c {
        if $c ~~ / \, / {
            my @go = $c.split(/ \, / ) ;
            self.goto: @go[0].Int , @go[1].Int , @go[2].Int ;
        } else {
            if $c ~~ / ^\d / {
                self.p: $c ;
            } else { 
                if $c.chars>1 {
                    my $cmd = $c.substr(0,1);
                    my $param = $c.substr(1) ;
                    #say $cmd , " ", $param ; 
                    $output ~= self."$cmd"($param) ;
                } else {
                    $output ~= self."$c"() ;
                }
            }
        }
    }   
    #print self.d ;
    return $output ;
}


