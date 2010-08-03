class UsuariosController < ApplicationController

  before_filter :carregar_usuario, :only => [ :new, :edit, :create, :update, :show]

  def new
    render :new
  end

  alias :edit :new
  alias :show :new

  def create
    if @usuario.update_attributes( params[:usuario])
      self.usuario_atual = @usuario
      respond_to do |format|
        format.html do
          flash[:aviso] = "O seu usuário foi craido/atualizado com sucesso"
          redirect_to produtos_path
        end
      end
    else
      new
    end
  end

  alias :update :create

  protected

  def carregar_usuario
    @usuario = usuario_atual || Usuario.new
  end
end

