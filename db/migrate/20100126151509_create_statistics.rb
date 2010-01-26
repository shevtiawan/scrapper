class CreateStatistics < ActiveRecord::Migration
  def self.up
    create_table :statistics do |t|
      t.integer :rule_id
      t.time :time_added
      t.string :keyword
      t.float :download_time
      t.float :extract_time
      t.float :memory_consumption
      t.float :file_size_before_extraction
      t.float :file_size_after_extraction
      t.integer :number_of_product_should_be_extracted
      t.integer :number_of_product_extracted
      t.integer :number_of_true_product_extracted

      t.timestamps
    end
  end

  def self.down
    drop_table :statistics
  end
end
