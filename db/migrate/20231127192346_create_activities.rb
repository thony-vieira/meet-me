class CreateActivities < ActiveRecord::Migration[7.1]
  def change
    create_table :activities do |t|
      t.string :title
      t.string :type
      t.string :address
      t.string :image

      t.timestamps
    end
  end
end
