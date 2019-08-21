# color.rb
module SketchupFFI

  class SUColor < FFI::Struct
    layout(
      :red, :subyte,
      :green, :subyte,
      :blue, :subyte,
      :alpha, :subyte
    )
    # @return [SUColor]
    def self.create(red = 0, green = 0, blue = 0, alpha = 255)
      color = new
      color[:red] = red
      color[:green] = green
      color[:blue] = blue
      color[:alpha] = alpha
      color
    end

    # @private
    def inspect
      "#<SUColor (#{self[:red]}, #{self[:green]}, #{self[:blue]}, #{self[:alpha]})>"
    end
  end

  attach_function(:SUColorBlend, [SUColor, SUColor, :double, SUColor], SUResult)
  attach_function(:SUColorGetNumNames, [:size_ptr], SUResult)
  attach_function(:SUColorGetNames, [SUStringRef, :size_t], SUResult)
  attach_function(:SUColorSetByName, [SUColor, :string], SUResult)
  attach_function(:SUColorSetByValue, [SUColor, :size_t], SUResult)

end
