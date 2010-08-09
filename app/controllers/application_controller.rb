# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

class ApplicationController < ActionController::Base
  helper :all # include all helpers, all the time
  protect_from_forgery # See ActionController::RequestForgeryProtection for details

  include AutenticacaoControllerHelper

  # Scrub sensitive parameters from your log
  # filter_parameter_logging :password
  filter_parameter_logging /senha/
  

  helper_method :pedido_atual, :usuario_atual, :logado?, :administrador?



  

  def load_page
    @page = params[:page] || 1
    @per_page = params[:per_page] || 10
    if @per_page.to_i > 30
      @per_page = 30
    end
  end

  def paginate( scope, options = {})
    load_page
    scope.paginate( { :page => @page, :per_page => @def_page }.merge( options ))
  end

end
