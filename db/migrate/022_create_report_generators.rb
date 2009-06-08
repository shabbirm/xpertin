class CreateReportGenerators < ActiveRecord::Migration
  def self.up
    create_table :report_generators do |t|

      t.timestamps
    end
  end

  def self.down
    drop_table :report_generators
  end
end
