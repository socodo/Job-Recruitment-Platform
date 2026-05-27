class CreateCrawlLogs < ActiveRecord::Migration[8.1]
  def change
    create_table :crawl_logs do |t|
      t.string :source, null: false
      t.string :status, null: false, default: 'pending'
      t.datetime :started_at
      t.datetime :finished_at
      t.integer :total_found, null: false, default: 0
      t.integer :total_created, null: false, default: 0
      t.integer :total_updated, null: false, default: 0
      t.text :error_message

      t.timestamps
    end

    add_index :crawl_logs, :source
    add_index :crawl_logs, :status
    add_index :crawl_logs, :started_at
  end
end
