# encoding: UTF-8

require 'sip/concerns/models/usuario'
require 'jn316_gen/concerns/models/usuario'
require 'cor1440_gen/concerns/models/usuario'

class Usuario < ActiveRecord::Base
  include Sip::Concerns::Models::Usuario
  include Jn316Gen::Concerns::Models::Usuario
  include Cor1440Gen::Concerns::Models::Usuario

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

end
