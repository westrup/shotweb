class YearsController < ApplicationController
  def index
    #@years = Event.all.sort_by { |e| e.start_date }.group_by{ |e| e.start_date.year }
    @years = Event.all.select { |e| !e.photos.first.nil?}.sort_by { |e| e.start_date }.reverse.group_by{ |e| e.start_date.year }
  end
  
  def show
    @year = params[:id]
    @events = index[@year.to_i]
  end
end
