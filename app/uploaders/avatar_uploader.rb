class AvatarUploader < CarrierWave::Uploader::Base
  include CarrierWave::MiniMagick

  storage :file
  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{model.price_id}/#{model.id}"
  end

  version :thumb do
    process :resize_to_fill => [120,120]
  end

end
