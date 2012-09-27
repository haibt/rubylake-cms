class AddColumnLogoSetting < ActiveRecord::Migration
   def self.up
    change_table :settings do |t|
      t.has_attached_file :logo
    end
  end

  def self.down
    drop_attached_file :settings, :logo
  end
end
