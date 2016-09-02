class BaseUploader < CarrierWave::Uploader::Base
  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}"
  end

  def filename
    @name ||= "#{model.id}_#{timestamp}.#{file.extension}" if original_filename.present?
  end

  def extension_whitelist
    %w(jpg jpeg png)
  end

  protected

  def timestamp
    var = :"@#{mounted_as}_timestamp"
    model.instance_variable_get(var) or model.instance_variable_set(var, Time.now.to_i)
  end
end
