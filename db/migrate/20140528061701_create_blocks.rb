class CreateBlocks < ActiveRecord::Migration
  def change
    create_table :blocks do |t|
      t.string      :name
      t.string      :client
      t.string      :raw_id
      t.timestamps
      t.text        :details
    end
  end
end
