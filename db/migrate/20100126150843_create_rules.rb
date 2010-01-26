class CreateRules < ActiveRecord::Migration
  def self.up
    create_table :rules do |t|
      t.string :name
      t.string :url
      t.string :item_rule
      t.string :product_name_rule
      t.string :price_rule

      t.timestamps
    end
  end

  def self.down
    drop_table :rules
  end
end
