$LOAD_PATH.unshift File.expand_path("../../lib", __FILE__)

module Attospec
  extend self

  class << self
    def results
      @@results.join ""
    end

    def failures
      @@failures
    end

    def reset
      @@results = []
      @@failures = []
    end
  end

  def at_exit() end
end

require "attospec"
