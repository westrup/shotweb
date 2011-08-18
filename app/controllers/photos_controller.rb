require 'RMagick'

class PhotosController < ApplicationController
  caches_page :thumb
  include Magick

  def thumb
    if ["100","200","400","800"].include?(params[:size])
      image = ImageList.new(Photo.find(params[:id]).filename)
      image.auto_orient!
      scale_factor = params[:size].to_f / [image.columns, image.rows].max
      if scale_factor < 0.2
        image = image.thumbnail(scale_factor)
      else
        image = image.resize(scale_factor)
      end
      send_data image.to_blob, :type => :jpg, :disposition => "inline"
    end
  end

  def photo
    image = ImageList.new(Photo.find(params[:id]).filename)
    send_data image.auto_orient.to_blob, :type => :jpg, :disposition => "inline"
  end

end
