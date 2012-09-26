class AddAttachmentImgBgToThemes < ActiveRecord::Migration
  def self.up
    change_table :themes do |t|
      t.has_attached_file :img_bg
    end
  end

  def self.down
    drop_attached_file :themes, :img_bg
  end
end
