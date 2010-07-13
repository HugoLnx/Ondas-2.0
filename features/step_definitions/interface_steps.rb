Dado /^que inicio o programa$/ do
  @app = Ondas2::Aplicacao.new
  @app.inicia :teste => true
end

Entao /^devo vizualizar [oa] "([^\"]*)" "([^\"]*)"$/ do |classe_comp_s, nome_comp|
  classe_comp = Ondas2.const_get classe_comp_s
  comp = @app.componentes.o_de_classe_e_nome classe_comp, nome_comp
  comp.should be_visible unless comp.kind_of? JFrame # o if impede que o teste quebre quando a 
												 # aplicacao iniciar em modo de teste.
end

Dado /^que preencho a caixa de texto "([^"]*)" com "([^"]*)"$/ do |nome, preenchimento|
  caixa_txt = @app.componentes.o_de_classe_e_nome JTextField, nome
  caixa_txt.text = preenchimento
end

Quando (/^clico no botao "([^"]*)"$/) do |nome|
  botao = @app.componentes.o_de_classe_e_nome JButton, nome
  botao.do_click
end

Entao (/^vejo "([^"]*)" na "([^"]*)" "([^"]*)"$/) do |preenchimento_esperado,classe_comp_s,nome|
  classe_comp = Ondas2.const_get classe_comp_s
  caixa_txt = @app.componentes.o_de_classe_e_nome classe_comp, nome
  valor_recebido = caixa_txt.text.to_f
  valor_esperado = preenchimento_esperado.to_f
  valor_recebido.should be_eql valor_esperado
end