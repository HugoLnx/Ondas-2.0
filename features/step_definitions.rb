Dado /^que inicio o programa$/ do
  @app = Ondas2::Modelos::InfraE::Aplicacao.new
  @app.inicia :teste => true
end

Entao /^devo vizualizar [oa] "([^\"]*)" "([^\"]*)"$/ do |classe_comp_s, nome_comp|
  comp = @app.componentes.o_de_classe_e_nome classe_comp_s, nome_comp
  comp.should be_visible unless comp.kind_of? JFrame # o if impede que o teste quebre quando a 
												 														 # aplicacao iniciar em modo de teste.
end

Dado /^que preencho a caixa de texto "([^"]*)" com "([^"]*)"$/ do |nome, preenchimento|
  caixa_txt = @app.componentes.o_de_classe_e_nome 'JTextField', nome
  caixa_txt.text = preenchimento
end

Quando (/^clico( duas vezes|) no botao "([^"]*)"$/) do |duas_vezes_s,nome|
  botao = @app.componentes.o_de_classe_e_nome 'JButton', nome
  botao.do_click
  botao.do_click unless duas_vezes_s.empty?
end

Entao (/^vejo "([^"]*)" na "([^"]*)" "([^"]*)"$/) do |preenchimento_esperado,classe_comp_s,nome|
  caixa_txt = @app.componentes.o_de_classe_e_nome classe_comp_s, nome
  valor_recebido = caixa_txt.text
  valor_esperado = preenchimento_esperado
  if classe_comp_s == 'JTextField'
		valor_recebido = valor_recebido.to_f
		valor_esperado = valor_esperado.to_f
  end
  valor_recebido.should be_eql valor_esperado
end

Entao /^vejo a "([^"]*)" "([^"]*)" vazia$/ do |classe_comp_s, nome|
  caixa_txt = @app.componentes.o_de_classe_e_nome classe_comp_s, nome
  caixa_txt.text.strip.should be_empty
end

Entao (/^devo vizualizar as abas: "([^"]*)"$/) do |abas_s|
  barra_menu = @app.componentes.o_de_classe_e_nome 'BarraMenu', 'barra_menu'
  abas = abas_s.split ','
  abas.each do |texto_aba|
	tem_aba = barra_menu.sub_elements.any?{|menu_aba| 
		menu_aba.text == texto_aba}
	tem_aba.should be_true
  end
end

