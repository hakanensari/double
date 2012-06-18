require 'test/unit'
require 'double'

module Foo
  class << self
    attr_accessor :double
  end
end

class TestDouble < Test::Unit::TestCase
  def test_lazy_evaluate
    assert_raise NameError do
      Foo.class_eval 'self.double = Bar'
    end

    Foo.extend Double
    Foo.class_eval 'self.double = Bar'
    e = assert_raise NameError do
      Foo.double.baz
    end
    assert_equal 'uninitialized constant Bar', e.message

    Kernel.const_set :Bar, Module.new
    assert_raise NoMethodError do
      Bar.baz
    end
    assert_raise NoMethodError do
      Foo.double.baz
    end

    Bar.class_eval { def self.baz; 1; end }
    assert_equal 1, Bar.baz
    assert_equal 1, Foo.double.baz
  end

  def test_memoize
    Double::Klass.class_eval { def method_missing(*args); 2; end }
    assert_equal 1, Foo.double.baz
    assert_equal 2, Foo.double.qux
  end
end
