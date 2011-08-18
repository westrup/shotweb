Shotweb::Application.routes.draw do
  resources :years, :only => [:index, :show]
  resources :events, :only => [:show]
  match "events/:id/:photo_nbr" => "events#photo", :as => :event_photo
  resources :tags, :only => [:index, :show]
  match "tags/:id/:photo_nbr" => "tags#photo", :as => :tag_photo
  match "photos/:id/:size.jpg" => "photos#thumb", :as => :thumb, :defaults => { :format => 'jpg' }
  match "photos/:id.jpg" => "photos#photo", :as => :photo, :defaults => { :format => 'jpg' }
  root :to => 'years#index'
end
