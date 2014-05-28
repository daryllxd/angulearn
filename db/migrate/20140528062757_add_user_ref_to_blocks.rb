class AddUserRefToBlocks < ActiveRecord::Migration
  def change
    add_reference :blocks, :user, index: true
  end
end
