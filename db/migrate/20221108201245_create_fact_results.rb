class CreateFactResults < ActiveRecord::Migration[7.0]
  def change
    create_table :fact_results do |t|
      t.string :url
      t.string :value

      t.timestamps
    end
  end
end
