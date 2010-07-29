class AddPedidoCountToUsuarios < ActiveRecord::Migration
  def self.up
    add_column :usuarios, :pedidos_count, :integer, :default => 0
  end

  def self.down
    remove_column :usuarios, :pedidos_count
  end
end
