# encoding: UTF-8

require 'cor1440_gen/concerns/models/efecto'


module Cor1440Gen
  class Efecto < ActiveRecord::Base
    include Cor1440Gen::Concerns::Models::Efecto

    has_many :efecto_valorcampotind, dependent: :delete_all,
      class_name: '::EfectoValorcampotind',
      foreign_key: 'efecto_id', validate: true
    accepts_nested_attributes_for :efecto_valorcampotind,
      allow_destroy: true, reject_if: :all_blank

    has_many :valorcampotind, :through => :efecto_valorcampotind,
      class_name: '::Cor1440Gen::Valorcampotind'
    accepts_nested_attributes_for :valorcampotind,  reject_if: :all_blank

    campofecha_localizado :fecha20
    campofecha_localizado :fecha40
    campofecha_localizado :fecha60
    campofecha_localizado :fecha80
    campofecha_localizado :fecha100

    validates :observacionesdir, length: { maximum: 1000 } 
    validates :porcentajeprog, numericality: { 
      greater_than_or_equal_to: 0,
      less_than_or_equal_to: 100,
      allow_blank: true
    }

    validate :fechaporc_en_orden
    def fechaporc_en_orden
      fechas = [fecha20, fecha40, fecha60, fecha80, fecha100]
      (0..4).each do |i|
        (i+1..4).each do |j|
          if fechas[i] && fechas[j]
            if fechas[j] < fechas[i]
              campo="fecha#{20*(j+1)}"
              errors.add(campo.to_sym, 
                         "Fecha del #{20*(j+1)}% debería ser posterior " +
                         "a la del #{20*(i+1)}%")
            else
              break
            end
          end
        end
      end
    end


    attr_accessor :linea
    def linea
      #byebug
      g=Cor1440Gen::GruposHelper.mis_grupos_sinus(registradopor)
      return '' if g.nil?
      g = g.where("nombre like 'Línea%'")
      if g.count == 1
        g.take.nombre
      else
        ''
      end
    end

    attr_accessor :porcentajeprogop
    def porcentajeprogop
      if porcentajeprog &&
        indicadorpf && indicadorpf.tipoindicador && 
        indicadorpf.tipoindicador.pprogtind && 
        indicadorpf.tipoindicador.pprogtind.length > 0 then
        p = indicadorpf.tipoindicador.pprogtind.order(:porcentaje)
        i = 0
        while (i < p.length && (p[i].porcentaje.nil?  || 
                                p[i].porcentaje <= porcentajeprog)) do
          i += 1
        end
        if i >= 1 then
          return  p[i - 1].id
        end
      end
      return nil
    end

  end
end
