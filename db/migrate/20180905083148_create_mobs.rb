class CreateMobs < ActiveRecord::Migration[5.2]
  def change
    create_table :mobs do |t|
      t.string :name
      t.string :phone
      t.text :web_url_1
      t.text :web_url_2
      t.text :description
    end
  end
end
