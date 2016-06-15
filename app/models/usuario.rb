# encoding: UTF-8

class Usuario < Cor1440Gen::Usuario

  validates_presence_of :nombre
 
  has_many :proyectofinanciero_usuario, #dependent: :destroy,
    class_name: '::ProyectofinancieroUsuario',
    foreign_key: 'usuario_id'
  has_many :proyectofinanciero, through: :proyectofinanciero_usuario,
    class_name: 'Cor1440Gen::Proyectofinanciero'

end
