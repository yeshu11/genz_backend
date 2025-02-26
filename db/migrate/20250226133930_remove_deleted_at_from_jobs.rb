class RemoveDeletedAtFromJobs < ActiveRecord::Migration[8.0]
  def change
    remove_column :jobs, :deleted_at, :datetime
  end
end
