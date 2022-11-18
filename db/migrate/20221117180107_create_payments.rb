class CreatePayments < ActiveRecord::Migration[7.0]
  def change
    create_table :payments do |t|
      t.string :name, null: false
      t.decimal :amount, precision: 10, scale: 2, null: false
      t.references :author, references: :users, null: false, foreign_key: { to_table: :users }, index: true

      t.timestamps
    end
  end
end
