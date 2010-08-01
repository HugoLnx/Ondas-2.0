aqui = File.dirname __FILE__
$LOAD_PATH << aqui

require 'java'

java_import javax.swing.BorderFactory
java_import javax.swing.Box
java_import javax.swing.BoxLayout
java_import javax.swing.ImageIcon
java_import javax.swing.JButton
java_import javax.swing.JDialog
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
java_import java.awt.Desktop
java_import java.awt.Dimension
java_import java.awt.GridBagLayout
java_import java.awt.GridBagConstraints
java_import java.awt.geom.Line2D
java_import java.awt.event.ActionListener

require 'controladores/observador'
require 'modelos/onda'
require 'modelos/infraestrutura/app'
require 'modelos/infraestrutura/fabrica_ondas'
require 'modelos/infraestrutura/float'
require 'modelos/infraestrutura/onda_exception'
require 'visoes/janela'
require 'visoes/janela_about_desenvolvedor'
require 'visoes/janela_about_ondas2'
require 'visoes/helpers/aba_menu'
require 'visoes/helpers/barra_menu'
require 'visoes/helpers/formulario_onda'
require 'visoes/helpers/painel_timer'
require 'visoes/helpers/painel_visualizacao'
