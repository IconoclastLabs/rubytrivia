class UILabel

  unless UILabel.instance_methods.include? :code_style
    def code_style text
      return if text.nil?
      self.text = text
      self.fit_to_size(40) # make it fit

      # prepare the vars
      ranges = []
      current_s = ""
      # find code and fill ranges array
      text.strip.split(/`/).each_with_index do |text_slice, index|
        if index.even?
          # Non-code elements just get added
          current_s += text_slice
        else
          # remove backticks and save position while adding
          code = text_slice.gsub("`", "")
          start_pos = current_s.length
          end_pos = start_pos + code.length - 1
          current_s += code
          ranges.push(start_pos..end_pos) #store range
        end
      end

      font_attrs = MotionMap::Map[NSFontAttributeName, UIFont.fontWithName( 'CourierNewPSMT', size: (self.font.pointSize - 2) )]
      string_styled = NSMutableAttributedString.alloc.initWithString( current_s, attributes: nil ).tap do |attrs|
        ranges.each do |code_range|
          attrs.setAttributes( font_attrs, range: code_range)
        end
      end

      self.attributedText = string_styled
    end

  end

end