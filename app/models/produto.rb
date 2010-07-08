class Produto < ActiveRecord::Base

  #set_table_name 'produto' //setar o nome da tabela

  validates_presence_of :nome, :preco
  validates_numericality_of :preco, :great_than => 0, :allow_nil => true

  
end
