class ConvierteTiposindprog < ActiveRecord::Migration[5.2]
  def up
    execute <<-SQL
      UPDATE cor1440_gen_tipoindicador SET
        desc20='Convocado', 
        desc40='Propuestas construida',
        desc60='Propuesta validada',
        desc80='Aprobado por ente gubernamental',
        desc100='Desarrollado e implementado'
      WHERE id='22';
      UPDATE cor1440_gen_tipoindicador SET
        desc20='20%', 
        desc40='40%',
        desc60='60%',
        desc80='80%',
        desc100='100%'
      WHERE id='19';
    SQL
  end
  def down
    execute <<-SQL
      UPDATE cor1440_gen_tipoindicador SET
        desc20=NULL,
        desc40=NULL,
        desc60=NULL,
        desc80=NULL,
        desc100=NULL
      WHERE id IN ('19', 22');
    SQL
  end
end
