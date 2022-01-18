# Make kakoune nicer to use with colemak/my funky keyboard.
#
# Shift these directional keys one unit to the right so that they are
# one-per-finger instead of the index finger covering left and down.

# neio -> hjkl the ripple that causes

# h -> o
# n -> h
# e -> j
# i -> k
# o -> l

# j -> n
# k -> e
# l -> i

# h -> o
map global normal h o
map global normal H O
map global normal <a-h> <a-o>
map global normal <a-H> <a-O>
unmap global goto h

# n -> h
map global normal n h
map global normal N H
map global normal <a-n> <a-h>
map global normal <a-N> <a-H>
map global goto n h

# e -> j
map global normal e j
map global normal E J
map global normal <a-e> <a-j>
map global normal <a-E> <a-J>
map global goto e j

# i -> k
map global normal i k
map global normal I K
map global normal <a-i> <a-k>
map global normal <a-I> <a-K>
map global goto i k

# o ->l
map global normal o l
map global normal O L
map global normal <a-o> <a-l>
map global normal <a-O> <a-L>
map global goto o l

# j -> n
map global normal j n
map global normal J N
map global normal <a-j> <a-n>
map global normal <a-J> <a-N>
unmap global goto j

# k -> e
map global normal k e
map global normal K E
map global normal <a-k> <a-e>
map global normal <a-K> <a-E>
unmap global goto k

# l -> i
map global normal l i
map global normal L I
map global normal <a-l> <a-i>
map global normal <a-L> <a-I>
unmap global goto l
