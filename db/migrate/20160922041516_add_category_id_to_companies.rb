class AddCategoryIdToCompanies < ActiveRecord::Migration[5.0]
  def change
    add_column :companies, :category_id, :integer
  end
end
