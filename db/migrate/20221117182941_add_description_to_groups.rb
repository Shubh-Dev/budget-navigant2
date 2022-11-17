class AddDescriptionToGroups < ActiveRecord::Migration[7.0]
  def change
    add_column :groups, :description, :string
  end
end
