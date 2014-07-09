# encoding: utf-8

class MealUploader < CarrierWave::Uploader::Base
  include CarrierWave::MiniMagick


  storage :file

  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end
  # this is my no size method error going to fix tomorrow
  # process :resize_to_fit => [200, 300]
  #
  # version :thumb do
  #   process :resize_to_fit => [50, 50]
  # end

  def extension_white_list
    %w(jpg jpeg gif png)
  end


end
