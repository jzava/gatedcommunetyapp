class Company < ApplicationRecord
  belongs_to :user
  belongs_to :category
  has_many :reviews
  
 has_attached_file :company_img, styles: { company_index: "200x250>", company_show: "300x350>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :company_img, content_type: /\Aimage\/.*\z/
  
end
