class CreateItems < ActiveRecord::Migration[5.1]
  def change
    create_table :items do |t|
      t.string :body
      t.boolean :completed, default: false
      t.references :list, foreign_key: true

      t.timestamps
    end
  end
end
