class CreateExpenses < ActiveRecord::Migration[7.1]
  def change
    create_table :expenses do |t|

      t.timestamps
    end
  end
end
