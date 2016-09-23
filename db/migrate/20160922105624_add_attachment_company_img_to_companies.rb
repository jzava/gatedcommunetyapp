class AddAttachmentCompanyImgToCompanies < ActiveRecord::Migration
  def self.up
    change_table :companies do |t|
      t.attachment :company_img
    end
  end

  def self.down
    remove_attachment :companies, :company_img
  end
end
