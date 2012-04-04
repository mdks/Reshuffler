require 'css_parser'
include CssParser

class CSSPusher

  def initialize(css, dir, amt)

    @parser = CssParser::Parser.new
    @parser.load_uri!(css)

    @parser.each_rule_set do |rule_set|
      if rule_set['position'] == "absolute;"
        if dir == 'right'
        rule_set['left'] = "#{rule_set['left'].to_i + amt}px;"
        elsif dir == 'left'
          rule_set['left'] = "#{rule_set['left'].to_i - amt}px;"
        elsif dir == 'up'
          rule_set['top'] = "#{rule_set['top'].to_i - amt}px;"
        elsif dir == 'down'
          rule_set['top'] = "#{rule_set['top'].to_i + amt}px;"
        end
      end
    end

  end

  def out
    @parser.to_s
  end


end