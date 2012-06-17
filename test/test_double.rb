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
    assert_raise NameError do
      Foo.double.baz
    end

    Kernel.const_set :Bar, Class.new
    assert_raise NoMethodError do
      Bar.baz
    end
    assert_raise NoMethodError do
      Foo.double.baz
    end

    Bar.class_eval { def self.baz; 1; end }
    assert_equal 1, Bar.baz
    assert_equal 1, Foo.double.baz

    2.times do
      assert_raise ArgumentError do
        Foo.double.new 'bar'
      end
    end
  end

  def test_memoize
    Double::Klass.class_eval { def method_missing(*args); 2; end }
    assert_equal 1, Foo.double.baz
    assert_equal 2, Foo.double.qux
  end
end
