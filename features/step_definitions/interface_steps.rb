Dado /^que o usuario iniciou o programa$/ do
  @app = Ondas2::Aplicacao.new
  @app.inicia
end

Entao /^(|ele )deve vizualizar [oa] "([^\"]*)" "([^\"]*)"$/ do |none, classe_comp_s, nome_comp|
  classe_comp = Module.const_get classe_comp_s
  comp = @app.componentes.o_de_classe_e_nome classe_comp, nome_comp
  comp.should be_visible
end

Dado /^que a caixa de texto "([^"]*)" foi preenchida com "([^"]*)"$/ do |nome, preenchimento|
  caixa_txt = @app.componentes.o_de_classe_e_nome JTextField, nome
  caixa_txt.text = preenchimento
end

Dado (/^que clicaram no botao "([^"]*)"$/) do |nome|
  botao = @app.componentes.o_de_classe_e_nome JButton, nome
  botao.do_click
end

Entao /^a caixa de texto "([^"]*)" deve ter o texto "([^"]*)"$/ do |nome, preenchimento_esperado|
  caixa_txt = @app.componentes.o_de_classe_e_nome JTextField, nome
  caixa_txt.text.should be_eql preenchimento_esperado
end