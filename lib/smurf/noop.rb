module Smurf
  # This is a no-op; essentially a NullObject pattern implementation. Saves from implementing logic elsewhere
  class Noop
    def self.minifies?(paths) true; end
    def initialize(content) @content = content; end
    def minified; @content; end
  end # Noop
end # Smurf