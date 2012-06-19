# Double

[![travis][status]][travis]

## Description

Something can be [familiar, yet foreign at once][uncanny].

**Double** allows you to use a constant before it is defined when
metaprogramming.

## Usage

```ruby
class Foo
  extend Double
  Bar # nothing raised
end
```

[status]: https://secure.travis-ci.org/hakanensari/double.png
[travis]: http://travis-ci.org/hakanensari/double
[uncanny]: http://www-rohan.sdsu.edu/~amtower/uncanny.html
