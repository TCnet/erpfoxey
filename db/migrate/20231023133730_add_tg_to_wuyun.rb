class AddTgToWuyun < ActiveRecord::Migration[7.0]
  def change
    add_column :wuyuns, :tgyear, :string
  end
end
