# encoding: UTF-8

require 'sip/concerns/models/usuario'
require 'jn316_gen/concerns/models/usuario'
require 'cor1440_gen/concerns/models/usuario'

class Usuario < ActiveRecord::Base
  include Sip::Concerns::Models::Usuario
  #Bastantes cambios respecto a Cor1440Gen::Concerns::Models::Usuario
  include Jn316Gen::Concerns::Models::Usuario

  devise :database_authenticatable, :rememberable, 
    :trackable, :lockable

  validates_presence_of :nombres
  validates_presence_of :apellidos
 
  has_many :proyectofinanciero_usuario, #dependent: :destroy,
    class_name: '::ProyectofinancieroUsuario',
    foreign_key: 'usuario_id'
  has_many :proyectofinanciero, through: :proyectofinanciero_usuario,
    class_name: 'Cor1440Gen::Proyectofinanciero'

  has_many :coordinador_proyectofinanciero, #dependent: :destroy,
    class_name: '::CoordinadorProyectofinanciero',
    foreign_key: 'coordinador_id'


  belongs_to :oficina, class_name: 'Sip::Oficina',
    foreign_key: "oficina_id", validate: true

  has_many :actividad_usuario, dependent: :delete_all,
    class_name: 'Cor1440Gen::ActividadUsuario',
    foreign_key: 'usuario_id'
  has_many :actividad, through: :actividad_usuario,
    class_name: 'Cor1440Gen::Actividad'


  def presenta_nombre
    if self.nombres
      r = self.nombres + ' ' + self.apellidos
    else
      r = self.nusuario
    end
    return r.strip
  end
end
