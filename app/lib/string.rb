class String

  unless String.instance_methods.include? :code_style
    def code_style
      ranges = []
      current_pos = 0
      current_s = self.strip
      # find code and fill ranges array
      current_s.scan(/`[^`]+`/).each do |code|
        ap "Need to replace #{code}"
        # factor in spaces!
        start_pos = current_s.index(code, current_pos) + 1
        end_pos = start_pos + code.length - 2
        ap "adding #{start_pos} and #{end_pos}"
        ranges.push(start_pos..end_pos)
      end

      font_attrs = MotionMap::Map[NSFontAttributeName, UIFont.fontWithName( 'CourierNewPSMT', size: 40 )]
      # remove backticks, but keep the count
      string_styled = NSMutableAttributedString.alloc.initWithString( current_s.gsub("`"," "), attributes: nil ).tap do |attrs|
        ranges.each do |code_range|
          attrs.setAttributes( font_attrs, range: code_range)
        end
      end

      string_styled
    end

  end

end