module Colorable
  extend ActiveSupport::Concern

  COLORS = {
    'red' => {
      'hex' => '#F44336',
      'rgb' => [244, 67, 54]
    },
    'pink' => {
      'hex' => '#E91E63',
      'rgb' => [233, 30, 99]
    },
    'purple' => {
      'hex' => '#9C27B0',
      'rgb' => [156, 39, 76]
    },
    'violet' => {
      'hex' => '#673AB7',
      'rgb' => [103, 58, 183]
    },
    'dark_blue' => {
      'hex' => '#3F51B5',
      'rgb' => [63, 81, 181]
    },
    'blue' => {
      'hex' => '#2196F3',
      'rgb' => [33, 150, 243]
    },
    'white_blue' => {
      'hex' => '#039BE5',
      'rgb' => [3, 155, 229]
    },
    'aqua' => {
      'hex' => '#0097A7',
      'rgb' => [0, 151, 167]
    },
    'green_blue' => {
      'hex' => '#009688',
      'rgb' => [0, 150, 136]
    },
    'lime' => {
      'hex' => '#43A047',
      'rgb' => [67, 160, 71]
    },
    'swamp' => {
      'hex' => '#827717',
      'rgb' => [130, 119, 23]
    },
    'orange' => {
      'hex' => '#EF6C00',
      'rgb' => [239, 108, 0]
    },
    'mandarin' => {
      'hex' => '#FF5722',
      'rgb' => [255, 87, 34]
    },
    'brown' => {
      'hex' => '#795548',
      'rgb' => [121, 85, 72]
    },
    'grey' => {
      'hex' => '#757575',
      'rgb' => [117, 117, 117]
    },
    'black' => {
      'hex' => '#333333',
      'rgb' => [51, 51, 51]
    },
    'blue_grey' => {
      'hex' => '#607D8B',
      'rgb' => [96, 125, 139]
    }
  }

  included do
    def self.colorate(*attributes)
      attributes.each do |attribute|
        ['rgb', 'hex'].each do |schema|
          define_method("#{attribute}_#{schema}") do
            COLORS[self.send(attribute)][schema]
          end
        end
      end
    end
  end

end
