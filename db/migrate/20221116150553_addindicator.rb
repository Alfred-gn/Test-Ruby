class Addindicator < ActiveRecord::Migration[7.0]
  def change
    add_column :documents, :nbresa, :integer
    add_column :documents, :nbbuyers, :integer
    add_column :documents, :buyersage, :integer
    add_column :documents, :resaprice, :float
  end
end
