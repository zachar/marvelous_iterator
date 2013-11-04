require File.dirname(__FILE__) + 'marvelous_iterator/array_iterator.rb'

class SortedArrayIterator < ArrayIterator
  def initialize(array)
    @array = array.sort{|a, b| a <=> b}
    @index = 0
  end
end
