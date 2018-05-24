
NAME
====

Terminal::asciisketch

SYNOPSIS
========

```perl6
    use Terminal::asciisketch ;
    
    my $a = Terminal::asciisketch.new(width => 10 , height => 3 );
    
    print $a.parse: "3 10,1,1 h10 11 l d" ;
```

DESCRIPTION
===========

directions are vi key bindings ;)
pen colour 0-9 are ascii grey scale
pen colour 32-126 are ascii characters
pen colour 10-12 are a few emojis

    $a.p: 10
set pen colour
    $a.pc: 15, "F"
set a character for a pen colour
    $a.d
draw picture
    $a.w
write history of commands, can be used with `parse`
    $a.goto: 0,0,1
teleport to x,y,p p=1 pen down p=0 pen up
    $a.u
toggle pen up/down

AUTHOR
======

Some dude who will do turtle graphics next.

COPYRIGHT AND LICENSE
=====================

Copyright 2018 Ken Town

This library is free software; you can redistribute it and/or modify it under the Artistic License 2.0.

