class TagsController < ApplicationController

  def index
    @tags = Tag.all
  end

  def show
    @tag = Tag.find(params[:id])
    @photos = @tag.photos.paginate :page => params[:page], :per_page => 9
  end

  def photo
    @tag = Tag.find(params[:id])
    @index = params[:photo_nbr].to_i
    @last_index = @tag.photos.length
    @page = (@index - 1) / 9 + 1
    @photo = @tag.photos[@index - 1]
    render :action => "photos/show"
  end

end
