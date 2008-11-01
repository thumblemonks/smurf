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
        remove_spaces_outside_block.remove_spaces_inside_block
        
    end

    module Minifier
      def compress_whitespace; gsub!(/\s+/, ' '); end
      def trim_close_bracket; gsub!(/;?\s?\}\s?/, '}'); end
      # .*? means it's a non-greedy match
      def remove_comments; gsub!(/\/\*.*?\*\/\s?/, ''); end
      # def seperate_bracket_from_class; gsub!(/\}\./, "} ."); end
      def remove_spaces_outside_block
        gsub!(/(\A|\})(.*?)\{/) { |m| m.gsub(/(,)\s|\s(?![.#:])/, '\1') }
      end
      def remove_spaces_inside_block
        gsub!(/\{(.*?)\}/) do |m|
          # remove spaces in the labels/attributes
          m.gsub(/(?:\A|\s*;)(.*?)(?::\s*|\z)/) { |n| n.gsub(/\s/, '') }
        end
      end
    end
  end # Stylesheet
end # Smurf
