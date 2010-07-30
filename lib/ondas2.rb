aqui = File.dirname __FILE__
$LOAD_PATH << aqui

require 'java'

java_import javax.swing.BorderFactory
java_import javax.swing.Box
java_import javax.swing.BoxLayout
java_import javax.swing.ImageIcon
java_import javax.swing.JButton
java_import javax.swing.JFrame
java_import javax.swing.JLabel
java_import javax.swing.JMenuBar
java_import javax.swing.JMenu
java_import javax.swing.JMenuItem
java_import javax.swing.JPanel
java_import javax.swing.JTextField
java_import javax.swing.Timer

java_import java.awt.BorderLayout
java_import java.awt.Color
java_import java.awt.Container
java_import java.awt.Dimension
java_import java.awt.GridBagLayout
java_import java.awt.GridBagConstraints
java_import java.awt.geom.Line2D
java_import java.awt.event.ActionListener


java_import java.lang.Runnable
JThread = java.lang.Thread

# Dando require de todas as classes do diretorio bin
ext = File.extname(__FILE__)
requiridos = Dir[File.join(aqui,"**/*#{ext}")]
requiridos.delete_if{|path| path.include? "ondas2#{ext}" or path.include? "main#{ext}"}
requiridos.each do |class_arq|
	requirido = class_arq.slice(/#{aqui}\/(.*)#{ext}$/,1)
	require requirido
end
