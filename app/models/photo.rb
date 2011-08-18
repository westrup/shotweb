class Photo < ActiveRecord::Base
  set_table_name :PhotoTable
  belongs_to :event
  default_scope order('exposure_time')
  default_scope :conditions => 'rating <> -1' # Skip rating = denied
  default_scope :conditions => 'event_id <> -1' # Skip photos in trash can
  default_scope :conditions => ['id not in (?)', Tag.find_by_name("Hidden").photos_ids] # Skip photos with "Hidden" tag
  
  def tags
    Tag.all.select do |tag|
      tag.photos_ids.include? id 
    end
  end
  
  def date
    Time.at(exposure_time)      
  end
end
