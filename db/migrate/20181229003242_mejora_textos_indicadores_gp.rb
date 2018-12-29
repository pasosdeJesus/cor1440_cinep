class MejoraTextosIndicadoresGp < ActiveRecord::Migration[5.2]
  def up
    execute <<-SQL
      UPDATE cor1440_gen_mindicadorpf SET 
        formulacion='(No. de informes enviados a financiadores en el tiempo requerido / No. de informes planeados para financiadores)*100', 
        descd2 = 'No. de informes planeados para financiadores' 
        WHERE id=4;
      UPDATE cor1440_gen_indicadorpf SET
        indicador='Porcentaje de informes que estamos enviado a tiempo a nuestros financiadores.  "A tiempo" significa: hasta cinco días hábiles después del día previsto para entrega, si se pacta un cambio de fecha con la fuente de financiación, esto debe quedar documentado por esrito - si la fecha es indicativa para un determinado contrato o convenio, debe estar documentado y constar en el convenio o contrato, y estas condiciones especiales deben ser cumplidas'
        WHERE id='26';
      UPDATE cor1440_gen_indicadorpf SET
      indicador='Porcentaje de informes narrativos sin devoluciones (Entendemos por "DEVOLUCION": cuando el informe narrativo no se haya diligenciado en los formatos adecuados ni con la calidad requerida, según los requerimientos e instrucciones de la fuente de financiación. O de producto de insuficiente calidad, incompletos o con errores manfiestos.)'
        WHERE id='27';
       UPDATE cor1440_gen_indicadorpf SET
      indicador='Porcentaje de informes financieros sin devoluciones'
        WHERE id='28';
    SQL
  end
  def down
  end
end
