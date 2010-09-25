class CreateOrgranizations < ActiveRecord::Migration
  def self.up
    create_table :orgranizations do |t|
			t.string	:name
			t.text		:description

      t.timestamps
    end
  end

  def self.down
    drop_table :orgranizations
  end
end
