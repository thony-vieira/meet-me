class RemoveTypeFromActivities < ActiveRecord::Migration[7.1]
  def change
    remove_column :activities, :type, :string
  end
end
