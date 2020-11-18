class AddColumnProjects < ActiveRecord::Migration[6.0]
  def change
    add_column :projects, :creator, :string
  end
end
