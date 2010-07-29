class CriarUsuarios < ActiveRecord::Migration
  def self.up

    create_table :usuarios do |t|
      t.string :nome, :null => false
      t.string :email, :nul => false
      t.boolean :administrator, :default => false
      t.string :senha_em_hash
      t.string :salt
      t.datetime :ultimo_acesso_em
      t.timestamps
    end

    add_index :usuarios, :email, :unique => true
    add_index :usuarios, :ultimo_acesso_em

    add_column :pedidos, :usuario_id, :integer, :null => true
    add_index :pedidos, :usuario_id
  end

  def self.down
    drop_table :usuarios
    remove_column :pedidos, :usuario_id
  end
end
