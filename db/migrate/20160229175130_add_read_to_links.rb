class AddReadToLinks < ActiveRecord::Migration
  def change
    add_column :links, :read, :boolean, null: false
  end
end
