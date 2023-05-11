# Make kakoune nicer to use with the gallium layout/my funky keyboard.
#
# Shift these directional keys one unit to the right so that they are
# one-per-finger instead of the index finger covering left and down.

# haei -> hjkl and the ripple that causes

# h -> h
# a -> j
# e -> k
# i -> l

# j -> e
# k -> a
# l -> i

# a -> j
map global normal a j
map global normal A J
map global normal <a-a> <a-j>
map global normal <a-A> <a-J>
map global goto a j

# e -> k
map global normal e k
map global normal E K
map global normal <a-e> <a-k>
map global normal <a-E> <a-K>
map global goto e k

# i -> l
map global normal i l
map global normal I L
map global normal <a-i> <a-l>
map global normal <a-I> <a-L>
map global goto i l

# j -> e
map global normal j e
map global normal J E
map global normal <a-j> <a-e>
map global normal <a-J> <a-E>
unmap global goto j

# k -> a
map global normal k a
map global normal K A
map global normal <a-k> <a-a>
map global normal <a-K> <a-A>
unmap global goto k

# l -> i
map global normal l i
map global normal L I
map global normal <a-l> <a-i>
map global normal <a-L> <a-I>
unmap global goto l

# comfier than k
map global goto n a
