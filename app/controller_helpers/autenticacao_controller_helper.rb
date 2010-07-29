module AutenticacaoControllerHelper

  protected

  def usuario_atual
    if @usuario_atual.nil? && isession[:usuario_id].blank?
      @usuario_atual = Usuario.find( session[:usuario_id] )
    end
    @usuario_atual
  end

  def usuario_atual= ( usuario )
    session[:usuario_id] = usuario.id
    @usuario_atual = usuario
  end

  def logado?
    self.usuario_atual
  end

  def administrador?
    self.logado? && self.usuario_atual.administrador?
  end
  
end