=begin
	Sobre mim...
	Nome: Hugo Roque(a.k.a HugoLnx)
	Email: hugo.roque@caelum.com.br
	Twitter: http://www.twitter.com/hugolnx
=end

DIR_RB = 'lib'
DIR_CLASS = 'bin/classes'
DIR_EXECUTAVEL = 'executavel'

task :compilar do
	aqui = File.dirname __FILE__
	
	dirs = Dir[File.join(aqui,"lib/**/")].sort
	scripts_na_lib_lib = (Dir[File.join(aqui,"#{DIR_RB}/**.rb")]).sort
	scripts_na_lib = Dir[File.join(aqui,'lib/*.rb')].sort
	
	puts '=> Criando diretorios para os arquivos compilados...'
	dirs.each do |dir|
		new_dir = dir.sub DIR_RB,DIR_CLASS
		unless File.exist? new_dir
			puts " Criando diretório #{new_dir}"
			Dir.mkdir new_dir
		end
	end
	
	puts '=> Compilando scripts ...'
	threads = []
	dir = File.join aqui, DIR_RB
	scripts_na_lib_lib.each do |script|
			sh "jruby -S jrubyc \"#{script}\" -d \"#{dir}\" -t \"#{DIR_CLASS}/\""
	end
end

task :executavel do
	require 'fileutils'

	aqui = File.dirname __FILE__
	
	executavel_dir = File.join(aqui,DIR_EXECUTAVEL)
	
	if File.exist? executavel_dir
		puts "O Diretorio #{DIR_EXECUTAVEL} ja existe.\nDeseja continuar mesmo assim?(y/n)"
		resposta = gets
		FileUtils.rm_r executavel, :force => true if resposta.chop.downcase == 'y'
		return
	end
	Dir.mkdir executavel_dir
	FileUtils.cp_r File.join(aqui,DIR_CLASS),File.join(aqui,DIR_EXECUTAVEL)
	
end