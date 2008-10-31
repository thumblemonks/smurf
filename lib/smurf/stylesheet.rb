module Smurf
  class Stylesheet
    def initialize(content)
      @content = content.dup
      minify
    end
    
    def minified; @content; end

    # TODO: deal with string values better (urls, content blocks, etc.)
    def minify
      rules = [
        [/\s+/, " "], [/ ?\{ ?/, "{"], [/;? ?\} ?/, "}"], [/\/\*.*\*\/ ?/, ""],
        [/ ?([,]) ?/, ','], [/ ?([:]) ?/, ':'], [/ ?([;]) ?/, ';']
      ]
      rules.each { |search, replace| @content.gsub!(search, replace) }
    end
  end # Stylesheet
end # Smurf
