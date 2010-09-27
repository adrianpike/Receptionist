class CreateResources < ActiveRecord::Migration
  def self.up
    create_table :resources do |t|
			t.string	:name
			t.text		:description
			
			t.boolean :is_guarded, :default => false
			t.text		:utilization_code
			
      t.timestamps
    end
  end

  def self.down
    drop_table :resources
  end
end
