module Ondas2
	class GrupoHashesObjs < Hash
		def adiciona(objeto,nome)
			self[objeto.class] ||= {}
			self[objeto.class][nome] = objeto
		end
		
		def o_objeto_de_classe_e_nome(classe,nome)
			self[classe][nome]
		end
		alias o_de_classe_e_nome o_objeto_de_classe_e_nome
	end
end