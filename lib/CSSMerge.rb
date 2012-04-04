require 'css_parser'
include CssParser

class CSSMerge

  def initialize(old_css, new_css)

    @parser_old = CssParser::Parser.new
    @parser_old.load_uri!(old_css)

    @parser_new = CssParser::Parser.new
    @parser_new.load_uri!(new_css)

    @old_css_hash = {}
    @new_css_hash = {}

    @parser_old.each_selector do |selector, declarations, specificity|
      @old_css_hash[selector] = declarations
    end

    @parser_new.each_selector do |selector, declarations, specificity|
      @new_css_hash[selector] = declarations
    end

    # @merged_css = @new_css_hash.merge!(@old_css_hash)
    #
    #     @global_out = ''
    #
    #     @merged_css.each do |selector, rules|
    #       @global_out += "#{selector} { #{rules} }\n\n"
    #     end

    @old_css_hash.each do |selector, rules|
      if @parser_new.find_by_selector(selector) == []
        @parser_new.add_block!("#{selector} { #{rules} }\n\n")
      end
    end

  end

  def out
    @parser_new.to_s
  end


end