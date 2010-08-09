class Item < ActiveRecord::Base
  belongs_to :produto
  belongs_to :pedido

  validates_numericality_of :quantidade

  def preco_total
    self.quantidade * self.produto.preco
  end
 end