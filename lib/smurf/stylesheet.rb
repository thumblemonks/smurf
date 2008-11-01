module Smurf
  class Stylesheet
    def initialize(content)
      @content = minify(content)
    end
    
    def minified; @content; end

    # TODO: deal with string values better (urls, content blocks, etc.)
    def minify(content)
      class << content; include Minifier; end
      content.compress_whitespace.trim_close_bracket.remove_comments.
        trim(%w[{ , : ;]).seperate_bracket_from_class
    end

    module Minifier
      def compress_whitespace; gsub!(/\s+/, ' '); end
      def trim_close_bracket; gsub!(/;? ?\} ?/, '}'); end
      # .*? means it's a non-greedy match
      def remove_comments; gsub!(/\/\*.*?\*\/ ?/, ''); end
      def seperate_bracket_from_class; gsub!(/\}\./, "} ."); end
      def trim(subs)
        Array(subs).each {|s| gsub!(%r[ ?[#{s}] ?], s)}
        self
      end
    end
  end # Stylesheet
end # Smurf
