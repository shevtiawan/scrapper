class RemoveTimeAddedFromStatistic < ActiveRecord::Migration
  def self.up
    remove_column :statistics, :time_added
  end

  def self.down
    add_column :statistics, :time_added

  end
end
