class CreateNewsComments < ActiveRecord::Migration[5.2]
  def change
    create_table :news_comments do |t|
      t.integer :news_id
      t.integer :comment_id

      t.timestamps
    end
  end
end
