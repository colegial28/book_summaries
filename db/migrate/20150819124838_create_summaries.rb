class CreateSummaries < ActiveRecord::Migration
  def change
    create_table :summaries do |t|
    	t.integer  :chapter_number
    	t.string   :chapter_title
    	t.text     :body
    	t.references :book
      t.timestamps null: false
    end
  end
end
