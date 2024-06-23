class CreateExpenses < ActiveRecord::Migration[7.1]
  def change
    create_table :expenses do |t|
      t.integer :month
      t.integer :year
      t.float :total
      t.string :user

      t.timestamps
    end
  end
end
