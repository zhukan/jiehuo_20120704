# encoding: utf-8

class AvatarUploader < CarrierWave::Uploader::Base

  # Include RMagick or ImageScience support:
  # include CarrierWave::RMagick
  # include CarrierWave::ImageScience
  include CarrierWave::MiniMagick

  # Choose what kind of storage to use for this uploader:
  storage :file
  # storage :s3

  # Override the directory where uploaded files will be stored.
  # This is a sensible default for uploaders that are meant to be mounted:
  def store_dir
    # "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
    "uploads"
  end

  # Provide a default URL as a default if there hasn't been a file uploaded:
  # def default_url
  #   "/images/fallback/" + [version_name, "default.png"].compact.join('_')
  # end

  # Process files as they are uploaded:
  #process :scale => [200, 300]
  #
  # def scale(width, height)
  #   # do something
  # end

  # Create different versions of your uploaded files:
  process :resize_to_fill => [200, 200]
  version :thumb do
    process :resize_to_fill => [100, 100]
  end

  version :super_large do
    process :resize_to_fill => [130, 130]
  end

  version :large do
    process :resize_to_fill => [74, 74]
  end

  version :mid do
    process :resize_to_fill => [45, 45]
  end

  version :min do
    process :resize_to_fill => [30, 30]
  end


  # version :original

  # Add a white list of extensions which are allowed to be uploaded.
  # For images you might use something like this:
  # def extension_white_list
  #   %w(jpg jpeg gif png)
  # end
  def extension_white_list
    %w(jpg jpeg gif png)
  end

  # Override the filename of the uploaded files:
  # def filename
  #   "something.jpg" if original_filename
  # end

  def filename
    if @filename
      now = Time.now
      now_s = now.to_i.to_s
      Digest::SHA1.hexdigest(original_filename)+now_s+ File.extname(@filename)
    end
  end



end
