class Tag < ActiveRecord::Base
  set_table_name :TagTable
  default_scope order('name')
  default_scope :conditions => 'photo_id_list is not null'
  
  def photos_ids
    photo_id_list.split(",").select { |t| t.include? "thumb"}.collect do |id|
      Integer("0x" + id.split("thumb")[1])
    end
  end

  def nbr_photos
    Photo.count(:all, :conditions => ['id in (?)', photos_ids]) # todo count much faster than find, could this extra method be avoided?    
  end

  def photos
    Photo.all(:conditions => ['id in (?)', photos_ids]).reverse # todo find(photos_ids) doesn't work, photo.rb filters some ids...
  end
end
