require File.join( File.dirname(__FILE__),"..","spec_helper")

describe Usuario do

  context "ao validar se a senha é correta" do

    before do
      @usuario = Factory( :usuario,
        :senha => "123456",
        :senha_confirmation => "123456")
    end

    it "deve dizer que a senha é correta se ela for '123456'" do
      @usuario.senha_correta?("123456").should be_true
    end

    it "deve dizer que a senha é incorreta se ela for '654321'" do
      @usuario.senha_correta?("654321").should be_false
    end

  end

  context "ao autenticar usuários" do

    before do
      @usuario = Factory( :usuario,
        :email => "jose@email.com",
        :senha => "123456",
        :senha_confirmation => "123456")
    end

    it "deve retornar o usuário correto quando estiverem corretos" do
      Usuario.autenticar("jose@email.com","123456").should == @usuario
    end

    it "deve retornar nil quando estiverem incorretos " do
      Usuario.autenticar("outro@email.com","123456").should be_nil
    end

    context "em chamadas de pedido_atual" do

      before do
        @usuario = Factory(:usuario)
        @pedido = Factory(:pedido, :usuario_id => @usuario.id)
      end

      it "deve retornar o pedido criado anteriormente" do
        @usuario.pedido_atual.should == @pedido
      end

      it "deve criar um novo pedido se ele não existir no banco" do
        @pedido.destroy
        @usuario.pedido_atual.should_not be_nil
      end

      it "deve garantir que há apenas im pedido atual depois no banco" do
        @pedido.destroy
        @usuario.pedido_atual
        Pedido.count.should == 1
      end

    end
    
  end

end