# encoding: UTF-8

class E1i1MedidoConActividad < ActiveRecord::Migration[6.0]

  def up
    execute <<-SQL
      -- medir on actividades
      UPDATE cor1440_gen_tipoindicador SET 
        medircon=3 WHERE id=18;
      -- no es indicador de efecto sino de resultaod
      UPDATE cor1440_gen_indicadorpf SET
        resultadopf_id=18, objetivopf_id=NULL
        WHERE id=18;
    SQL
  end

  def up
    execute <<-SQL
      -- medir como efecto
      UPDATE cor1440_gen_indicadorpf SET
        resultadopf_id=NULL, objetivopf_id=18
        WHERE id=18;
      -- indicador de efecto
      UPDATE cor1440_gen_tipoindicador SET 
        medircon=2 WHERE id=18;
    SQL
  end

end
