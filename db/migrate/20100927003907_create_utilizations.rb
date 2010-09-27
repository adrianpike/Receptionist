class CreateUtilizations < ActiveRecord::Migration
  def self.up
    create_table :utilizations do |t|

			t.boolean :approved, :default => true

			t.integer :resource_id
			t.integer :identity_id

      t.timestamps
    end
  end

  def self.down
    drop_table :utilizations
  end
end
