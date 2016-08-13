module Colorable
  extend ActiveSupport::Concern

  COLORS = {
    'red' => [244, 67, 54],
    'pink' => [233, 30, 99],
    'purple' => [156, 39, 76],
    'violet' => [103, 58, 183],
    'dark_blue' => [63, 81, 181],
    'blue' => [33, 150, 243],
    'white_blue' => [3, 155, 229],
    'aqua' => [0, 151, 167],
    'green_blue' => [0, 150, 136],
    'lime' => [67, 160, 71],
    'swamp' => [130, 119, 23],
    'orange' => [239, 108, 0],
    'mandarin' => [255, 87, 34],
    'brown' => [121, 85, 72],
    'grey' => [117, 117, 117],
    'black' => [51, 51, 51],
    'blue_grey' => [96, 125, 139]
  }

  included do
    def self.colorate(*attributes)
      attributes.each do |attribute|
        define_method("#{attribute}_rgb") do
          COLORS[self.send(attribute)]
        end
      end
    end
  end

end
