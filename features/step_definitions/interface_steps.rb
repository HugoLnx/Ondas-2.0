Dado /^que o usuario iniciou o programa$/ do
  @app = Ondas2::Aplicacao.new
  @app.inicia
end

Entao /^(|ele )deve vizualizar [oa] "([^\"]*)" "([^\"]*)"$/ do |none, classe_comp_s, nome_comp|
  classe_comp = Module.const_get classe_comp_s
  comp = Ondas2::Aplicacao.componentes.o_de_tipo_e_nome classe_comp, nome_comp
  comp.should be_visible
end