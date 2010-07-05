module Ondas2
	class Onda
		attr_reader :amplitude,:lambda,:velocidade,:frequencia,:periodo
		def initialize(dados={})
			@amplitude = dados[:amplitude].to_f unless dados[:amplitude].nil?
			@lambda = dados[:lambda].to_f unless dados[:lambda].nil?
			@velocidade = dados[:velocidade].to_f unless dados[:velocidade].nil?
			@frequencia = dados[:frequencia].to_f unless dados[:frequencia].nil?
			@periodo = dados[:periodo].to_f unless dados[:periodo].nil?
			
			calcular_propriedades
		end
		
		def calcular_propriedades
			@frequencia = 1/@periodo if !@periodo.nil? and @frequencia.nil?
			@frequencia = @velocidade/@lambda if @frequencia.nil?
			@velocidade = @lambda*@frequencia if @velocidade.nil?
			@lambda = @velocidade / @frequencia if @lambda.nil?
			@periodo = 1/@frequencia if @periodo.nil?
		end
	end
end