module Smurf
  class Stylesheet
    def initialize(content)
      @content = content.nil? ? nil : minify(content)
    end
    
    def minified; @content; end

    # TODO: deal with string values better (urls, content blocks, etc.)
    def minify(content)
      class << content; include Minifier; end
      content.compress_whitespace.remove_comments.remove_spaces_outside_block.
        remove_spaces_inside_block.trim_last_semicolon.strip
    end

    module Minifier
      # .*? is a non-greedy match on anything
      def compress_whitespace; compress!(/\s+/, ' '); end
      def remove_comments; compress!(/\/\*.*?\*\/\s?/, ''); end
      def remove_spaces_outside_block
        compress!(/(\A|\})(.*?)\{/) { |m| m.gsub(/\s?([}{,])\s?/, '\1') }
      end
      def remove_spaces_inside_block
        compress!(/\{(.*?)(?=\})/) do |m|
          # remove spaces in the labels/attributes
          m.gsub(/(?:\A|\s*;)(.*?)(?::\s*|\z)/) { |n| n.gsub(/\s/, '') }.strip
        end
      end
      def trim_last_semicolon; compress!(/;(?=\})/, ''); end
    private
      def compress!(*args, &block) gsub!(*args, &block) || self; end
    end
  end # Stylesheet
end # Smurf
