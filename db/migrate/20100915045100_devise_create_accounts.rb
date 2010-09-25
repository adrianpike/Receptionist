class DeviseCreateAccounts < ActiveRecord::Migration
  def self.up
    create_table(:identities) do |t|
			t.integer :user_id
			
			t.string :type
			t.string :name
			
			t.text	 :data
			
      t.timestamps
    end

  end

  def self.down
    drop_table :identities
  end
end
