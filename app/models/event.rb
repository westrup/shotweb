class Event < ActiveRecord::Base
  set_table_name :EventTable
  has_many :photos
  
  def primary_source
    Photo.find(Integer("0x" + primary_source_id.split("thumb")[1]))
  end
  
  def name
    if read_attribute(:name)
      read_attribute(:name)
    else
      start_date.strftime('%F')
    end
  end
  
  def start_date
    if photos.first.nil? # todo
      Time.at(0)
    else
      Time.at(photos.first.exposure_time)      
    end
  end
  
  def end_date
    if photos.last.nil?
      Time.at(0)
    else
      Time.at(photos.last.exposure_time)
    end
  end
end
