class EventsController < ApplicationController

  def show
    @event = Event.find(params[:id])
    @photos = @event.photos.paginate :page => params[:page], :per_page => 9
  end
  
  def photo
    @event = Event.find(params[:id])
    @index = params[:photo_nbr].to_i
    @last_index = @event.photos.length
    @page = (@index - 1) / 9 + 1
    @photo = @event.photos[@index - 1]
    render :action => "photos/show"
  end
  
end
