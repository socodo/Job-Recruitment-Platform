class CreateJobs < ActiveRecord::Migration[8.1]
  def change
    create_table :jobs do |t|
      t.references :company, null: false, foreign_key: true
      t.references :location, null: false, foreign_key: true
      t.string :title, null: false
      t.string :salary
      t.text :description
      t.text :requirements
      t.string :original_url, null: false, limit: 500
      t.date :posted_date

      t.timestamps
    end

    add_index :jobs, :original_url, unique: true
    add_index :jobs, :title
    add_index :jobs, :posted_date
    add_index :jobs, [:company_id, :location_id]
  end
end
