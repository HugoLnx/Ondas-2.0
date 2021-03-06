configuration do |c|
	# Undocumented option 'project_name'
	# default value: "ondas2.0"
	#
	c.project_name = "Ondas 2.0"

	# Undocumented option 'output_dir'
	# default value: "package"
	#
	c.output_dir = "bin"

	# Undocumented option 'main_ruby_file'
	# default value: "main"
	#
	#c.main_ruby_file = "main"

	# Undocumented option 'main_java_file'
	# default value: "org.rubyforge.rawr.Main"
	#
	c.main_java_file = "inicializador.InicializadorDaAplicacao"

	# Undocumented option 'source_dirs'
	# default value: ["src", "lib/ruby"]
	#
	#c.source_dirs = ["src", "lib"]

	# Undocumented option 'source_exclude_filter'
	# default value: []
	#
	#c.source_exclude_filter = []

	# Undocumented option 'jruby_jar'
	# default value: "lib/java/jruby-complete.jar"
	#
	c.jruby_jar = "ext/jruby-complete.jar"

	# Undocumented option 'compile_ruby_files'
	# default value: true
	#
	c.compile_ruby_files = false

	# Undocumented option 'java_lib_files'
	# default value: []
	#
	#c.java_lib_files = []

	# Undocumented option 'java_lib_dirs'
	# default value: ["lib/java"]
	#
	c.java_lib_dirs = ["ext"]

	# Undocumented option 'files_to_copy'
	# default value: []
	#
	c.files_to_copy = ['images/ondas2_32x32.png',
					   'images/ondas2_48x48.png',
					   'images/LnxLogo48x48.png']

	# Undocumented option 'target_jvm_version'
	# default value: 1.6
	#
	#c.target_jvm_version = 1.6

	# Undocumented option 'jvm_arguments'
	# default value: ""
	#
	#c.jvm_arguments = ""

	# Undocumented option 'java_library_path'
	# default value: ""
	#
	#c.java_library_path = ""

	# Undocumented option 'extra_user_jars'
	# default value: {}
	#
	#c.extra_user_jars[:data] = { :directory => 'data/images/png',
	#                             :location_in_jar => 'images',
	#                             :exclude => /*.bak$/ }

	# Undocumented option 'mac_do_not_generate_plist'
	# default value: nil
	#
	#c.mac_do_not_generate_plist = nil

	# Undocumented option 'mac_icon_path'
	# default value: "GenericJavaApp.icns"
	#
	#c.mac_icon_path = "GenericJavaApp.icns"

	# Undocumented option 'windows_icon_path'
	# default value: "GenericJavaApp.ico"
	#
	c.windows_icon_path = 'images/ondas2_32x32.png'

end
