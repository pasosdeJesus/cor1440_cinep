# encoding: UTF-8

class Contextoinv < ActiveRecord::Base
  include Sip::Modelo
  include Sip::Localizacion

  # Un contexto es una descripción asociada a.
  # - una región
  # - un usuario
  # - un periodo de tiempo
  # 
  # Dos contextos diferentes no se traslapan en rangos de tiempo
  #
  # Todas las actividades de un usuario, que empleen una región
  # y estén en el periodo de tiempo del contexto se deben relacionar
  # con el contexto.  
  #
  # Por eso es en tiempo de ejecución que se determina el contexto
  # de una actividad ante cambios de región, responsable o fecha de la
  # actividad.

  belongs_to :usuario, class_name: '::Usuario',
    foreign_key: 'usuario_id', validate: true
  
  belongs_to :regiongrupo, class_name: '::Regiongrupo',
    foreign_key: 'regiongrupo_id', validate: true

  has_many :actividad, validate: true,
    class_name: 'Cor1440Gen::Actividad', 
    foreign_key: 'contextoinv_id'

end
