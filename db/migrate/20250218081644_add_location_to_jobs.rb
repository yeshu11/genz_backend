class AddLocationToJobs < ActiveRecord::Migration[8.0]
  def change
    add_column :jobs, :location, :string
  end
end
