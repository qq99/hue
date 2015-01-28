module Hue
  module EditableState

    def self.included(base)
      %w{on hue saturation brightness color_temperature alert effect x y}.each do |key|
        define_method "#{key}=".to_sym do |value|
          set_state({key.to_sym => value})
          instance_variable_set("@#{key}".to_sym, value)
        end
      end
    end

    def on?
      @state['on']
    end

    def on!
      self.on = true
    end

    def off!
      self.on = false
    end

    def set_xy(x, y)
      set_state({:xy => [x, y]})
      @x, @y = x, y
    end
  end
end
