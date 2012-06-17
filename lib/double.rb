# Based on http://git.io/D7oevQ
require 'forwardable'

unless defined? BasicObject
  class BasicObject
    instance_methods.each do |mth|
      undef_method mth unless mth =~ /__/
    end
  end
end

module Double
  class Klass < BasicObject
    extend ::Forwardable

    def initialize(name)
      @name = name
    end

    def _
      @_ ||= ::Kernel.const_get @name
    end

    def method_missing(mth, *args, &blk)
      if _.respond_to? mth
        (class << self; self; end).instance_eval do
          def_delegator :@_, mth
        end
        @_.send mth, *args, &blk
      else
        super
      end
    end
  end

  def const_missing(name)
    Klass.new name
  end
end
