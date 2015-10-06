require "attospec/version"

module Attospec
  extend self

  @@results, @@failures = [], []

  def does?(&block)
    unless block.call
      record_failure 1
    else
      @@results << "."
    end
  rescue
    record_failure 2
  end
  alias is? does?

  def record_failure(line_from_caller)
    @@results << "F"
    file, line = caller[line_from_caller].split(":")[0..1]
    @@failures << "%s:%0.3d" % [file.split("/").last, line]
  end

  def self.run_results; ([@@results.join] + @@failures).join("\n"); end

  at_exit { puts run_results; exit @@failures.empty? }
end
