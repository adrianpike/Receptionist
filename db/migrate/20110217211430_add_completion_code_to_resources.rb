class AddCompletionCodeToResources < ActiveRecord::Migration
  def self.up
    add_column :resources, :utilization_length, :integer
    add_column :resources, :currently_utilizing, :boolean
    add_column :resources, :completion_code,	:text
  end

  def self.down
    remove_column :resources, :utilization_length
    remove_column :resources, :currently_utilizing
    remove_column :resources, :completion_code
  end
end
