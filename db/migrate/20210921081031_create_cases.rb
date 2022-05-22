class CreateCases < ActiveRecord::Migration[6.0]
  def change
    create_table :cases do |t|
      t.references :patient
      t.references :disease
      t.references :hospital
      t.integer :severity
      t.timestamps
    end
  end
end
