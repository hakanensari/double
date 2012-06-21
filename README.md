# Double

[![travis][status]][travis]

## Description

Something can be [familiar, yet foreign at once][uncanny].

**Double** allows you to reference a constant before it is defined—a useful
trick when metaprogramming.

## Usage

A contrived example:

```ruby
class Jekyll
  extend Double

  # Gets/Sets the alter ego of the class.
  #
  # klass - A Class.
  #
  # Returns the Class alter ego.
  def self.alter_ego(klass = nil)
    klass ? @alter_ego = klass : @alter_ego
  end
end

# Open the class and set the alter ego:
class Jeykll
  alter_ego Hyde
end

Jekyll.alter_ego # => #<Double::Klass:0x3fabc>

# But who is this Hyde? Define him:
class Hyde; end

Jekyll.alter_ego # => Hyde
```

[status]: https://secure.travis-ci.org/hakanensari/double.png
[travis]: http://travis-ci.org/hakanensari/double
[uncanny]: http://www-rohan.sdsu.edu/~amtower/uncanny.html
