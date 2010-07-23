require 'rawr'

DIR_RB = 'lib'
DIR_CLASS = 'bin/classes/ruby'
JRUBY_JAR = 'ext/jruby-complete.jar'

task :compilar do
	aqui = File.dirname __FILE__
	
	dirs = Dir[File.join(aqui,"lib/**/")].sort
	dirs_raiz = []
	dirs_juntos = aqui
	DIR_CLASS.split('/').each do |dir|
		dirs_juntos = File.join(dirs_juntos,dir)
		dirs_raiz << dirs_juntos
	end
	
	puts '=> Criando diretorios para os arquivos compilados...'
	dirs_raiz.sort.each do |dir|
		unless File.exist? dir
			puts " Criando diretório #{dir}"
			Dir.mkdir dir
		end
	end
	
	dirs.each do |dir|
		new_dir = dir.sub DIR_RB,DIR_CLASS
		unless File.exist? new_dir
			puts " Criando diretório #{new_dir}"
			Dir.mkdir new_dir
		end
	end
	
	scripts_na_lib = (Dir[File.join(aqui,"#{DIR_RB}/**/*.rb")]).sort
	puts '=> Compilando scripts ...'
	dir = File.join aqui, DIR_RB
	scripts_na_lib.each do |script|
			sh "jruby -S jrubyc \"#{script}\" -d \"#{dir}\" -t \"#{DIR_CLASS}/\""
	end
end

task :executar do
	aqui = File.dirname __FILE__
	sh "java -jar #{JRUBY_JAR} #{File.join(aqui,DIR_CLASS,'main.class')}"
end
