class AddNameToWuyun < ActiveRecord::Migration[7.0]
  def change
    add_column :wuyuns, :name, :string
    add_column :wuyuns, :year, :string
    add_column :wuyuns, :time, :string
    add_column :wuyuns, :wyst, :string
    add_column :wuyuns, :wykq, :string
    add_column :wuyuns, :wyzhy, :string
    add_column :wuyuns, :wyzhq, :string
    add_column :wuyuns, :wyzq, :string
  end
end
