class ChangeNameNullOnCompanies < ActiveRecord::Migration[8.1]
  def change
    change_column_null :companies, :name, false
  end
end
