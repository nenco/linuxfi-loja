Factory.define(:usuario) do |f|
  f.nome { Factory.next(:nome)  }
  f.email { Factory.next(:email) }
  f.senha "123456"
  f.senha_confirmation"123456"
  f.termos_e_condicoes "1"
end