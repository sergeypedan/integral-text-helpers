# frozen_string_literal: true

module Integral
  module TextHelpers
    module Aspect

      # @geometry<Hash width: Numeric, height: Numeric>
      def aspect_ratio_equal?(frame_geometry, img_geometry)
        aspect_ratio(img_geometry).round(3) == aspect_ratio(frame_geometry).round(3)
      end

      # @geometry<Hash width: Numeric, height: Numeric>
      # @return 1.234<Float>
      def aspect_ratio(geometry)
        geometry[:width].to_f / geometry[:height].to_f
      end

    end
  end
end
