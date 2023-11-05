class CreateWuyuns < ActiveRecord::Migration[7.0]
  def change
    create_table :wuyuns do |t|

      t.timestamps
    end
  end
end
