class PresentToIsPresent < ActiveRecord::Migration[6.0]
  def change
    rename_column :students, :present, :is_present
  end
end
