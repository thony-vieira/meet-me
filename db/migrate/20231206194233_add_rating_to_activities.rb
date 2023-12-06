class AddRatingToActivities < ActiveRecord::Migration[7.1]
  def change
    add_column :activities, :rating, :float
  end
end
