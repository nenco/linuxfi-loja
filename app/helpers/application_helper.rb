# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper

  def cabecalho_de_tabela(*args)
    colunas = args.map { |coluna| "<th>#{coluna}</th>\n" }
    linha = content_tag(:tr, colunas)
    content_tag( :thead, linha )
  end

  def render_flash
    render "compartilhados/flash", :flash => flash
  end

end
