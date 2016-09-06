module UnixTimeable
  extend ActiveSupport::Concern

  included do
    def self.unix_time(*attributes)
      attributes.each do |attribute|
        define_method("#{attribute}_unix") do
          self.send(attribute).to_time.to_i
        end
      end
    end
  end

end
