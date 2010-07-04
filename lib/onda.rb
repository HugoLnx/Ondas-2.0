module Ondas2
	class Onda
		attr_reader :amplitude,:lambda,:velocidade,:frequencia,:periodo
		def initialize(dados={})
			@amplitude = dados[:amplitude]
			@lambda = dados[:lambda]
			@velocidade = dados[:velocidade]
			@frequencia = dados[:frequencia]
			@periodo = dados[:periodo]
			
			@velocidade = @lambda * @frequencia if @velocidade.nil?
			@periodo = 1.0 / @frequencia  if @periodo.nil?
		end
	end
end