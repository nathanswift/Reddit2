class CreateTopics < ActiveRecord::Migration[5.2]
  def change
    create_table :topics do |t|
      t.string :name
      t.text :body
      t.integer :sub_id

      t.timestamps
    end
  end
end
