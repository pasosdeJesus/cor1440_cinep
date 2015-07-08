# encoding: UTF-8

class ReportesController < ::ApplicationController

  include Sip::ConsultasHelper

  # Indicador 1.1
  def indicador11
    pFaini = param_escapa('fechaini')
    pFafin = param_escapa('fechafin')

    cons = "SELECT DISTINCT cor1440_gen_actividad.id, usuario.nusuario,
    cor1440_gen_actividad.nombre as act_nombre, 
    redactor.nombre as red_nombre, 
    sip_municipio.nombre as municipio, sip_departamento.nombre as departamento, 
    (CASE WHEN alcance = 'Local' THEN 'X' ELSE '' END) AS local,
    (CASE WHEN alcance = 'Regional' THEN 'X' ELSE '' END) AS regional,
    (CASE WHEN alcance = 'Nacional' THEN 'X' ELSE '' END) AS nacional,
    (CASE WHEN alcance = 'Internacional' THEN 'X' ELSE '' END) AS internacional,
    nucleoconflicto.nombre as nucleoconflicto,
    ARRAY_TO_STRING(
      ARRAY(SELECT nucleoconflicto.nombre FROM actividad_nucleoconflicto 
      JOIN nucleoconflicto 
      ON actividad_nucleoconflicto.nucleoconflicto_id=nucleoconflicto.id 
      WHERE actividad_nucleoconflicto.actividad_id=cor1440_gen_actividad.id), 
      '; ') as otrosnucleos,
    ARRAY_TO_STRING(
      ARRAY(SELECT publicacion.nombre FROM actividad_publicacion
      JOIN publicacion
      ON actividad_publicacion.publicacion_id=publicacion.id 
      WHERE actividad_publicacion.actividad_id=cor1440_gen_actividad.id),
      '; ') as publicaciones
    FROM cor1440_gen_actividad JOIN actividad_publicacion 
        ON cor1440_gen_actividad.id=actividad_publicacion.actividad_id 
      LEFT JOIN usuario ON cor1440_gen_actividad.usuario_id = usuario.id
      LEFT JOIN redactor ON cor1440_gen_actividad.redactor_id=redactor.id 
      LEFT JOIN sip_municipio 
        ON cor1440_gen_actividad.municipio_id=sip_municipio.id
      LEFT JOIN sip_departamento
        ON cor1440_gen_actividad.departamento_id=sip_departamento.id
      LEFT JOIN nucleoconflicto
        ON cor1440_gen_actividad.nucleoconflicto_id=nucleoconflicto.id"
    where = ''
    if (pFaini != '') 
      where = " WHERE cor1440_gen_actividad.fecha >= '#{pFaini}'"
    end
    if (pFafin != '')
      if where == ''
        where += ' AND '
      else
        where = ' WHERE '
      end
      where += "cor1440_gen_actividad.fecha <= '#{pFafin}'"
    end
    cons += where + " ORDER BY 1"

    @cuerpotabla = ActiveRecord::Base.connection.select_all(cons)

    @enctabla = ['Id', 'Escenario de Toma de Decisión',
      'Red Vinculada', 'Municipio', 'Departamento', 
      'Local', 'Regional', 'Nacional', 'Internacional', 
      'Principal núcleo que transforma', 
      'Otros núcleos que transforma', 'Insumo con el que se participa'
    ]

    respond_to do |format|
      format.html {  }
      format.json { head :no_content }
      format.js   { render 'sip/reportes/cambiatabla' }
    end
  end

end
