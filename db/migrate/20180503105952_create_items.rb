class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.string :type
      t.string :by
      t.text :title
      t.string :url
      t.text :text

      t.timestamps
    end
  end
end
