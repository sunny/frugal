class CreateExpenses < ActiveRecord::Migration
  def self.up
    create_table :expenses do |t|
      t.float :amount
      t.string :title
      t.datetime :date
      t.integer :category_id

      t.timestamps
    end
  end

  def self.down
    drop_table :expenses
  end
end
