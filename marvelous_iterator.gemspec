# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require ('marvelous_iterator/version')

Gem::Specification.new do |gem|
  gem.authors       = ["Jacek Zachariasz"]
  gem.email         = ["zachariasz.jacek@gmail.com"]
  gem.description   = "Implementation of external iterator pattern from >Design Patterns in Ruby<"
  gem.summary       = "ArrayIterator and SortedArrayIterator classes"
  gem.homepage      = ""

  gem.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  gem.files         = `git ls-files`.split("\n")
  gem.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  gem.name          = "marvelous_iterator"
  gem.require_paths = ["lib", "lib/marvelous_iterator.rb"]
  gem.version       = MarvelousIterator::VERSION
end
