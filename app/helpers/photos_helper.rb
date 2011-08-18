module PhotosHelper
  
  def get_photo_path(index)
    if @tag
      tag_photo_path(@tag, index)
    elsif @event
      event_photo_path(@event, index)
    end
  end
  
  def get_parent_path(querystring=nil)
    if @tag
      tag_path(@tag, querystring)
    elsif @event
      event_path(@event, querystring)
    end    
  end

  def get_parent_name
    if @tag
      @tag.name
    elsif @event
      @event.name
    end
  end
end
