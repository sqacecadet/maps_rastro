class Flat < ActiveRecord::Base
  has_attached_file :picture,
    :path => ":rails_root/public/system/:attachment/:id/:style/:filename",
    :url => "/system/:attachment/:id/:style/:filename",
    :styles => { :medium => "300x300>", :thumb => "100x100>" },
    :default_url => "path to default image"

  validates_attachment_content_type :picture, content_type: /\Aimage\/.*\z/

  geocoded_by :address
  after_validation :geocode

end
