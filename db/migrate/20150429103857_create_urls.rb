class CreateUrls < ActiveRecord::Migration
  def change
    create_table :urls do |t|
      t.string :path
      t.string :short
      t.references :click

      t.timestamps
    end
  end
end
