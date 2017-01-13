class CreateEndoresments < ActiveRecord::Migration[5.0]
  def change
    create_table :endoresments do |t|

      t.timestamps
    end
  end
end
