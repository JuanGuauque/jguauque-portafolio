class CreateTecgnologies < ActiveRecord::Migration[7.0]
  def change
    create_table :tecgnologies do |t|
      t.string :name
      t.references :portfolio, foreign_key: true

      t.timestamps
    end
  end
end
