class HomologaIntermedios < ActiveRecord::Migration[6.0]
  def up
    rel = {
      19 =>[100, 101],
      20 => [103, 104],
      21 => [105],
      22 => [106],
      23 => [107, 108],
      26 => [120, 121],
      27 => [125, 126],
      28 => [130, 131],
      33 => [140, 141]
    }
    rel.each do |ind, ldi|
      cont = 1
      ldi.each do |iddi|
        e = "INSERT INTO cor1440_gen_datointermedioti_pmindicadorpf 
          (datointermedioti_id, pmindicadorpf_id, valor, rutaevidencia)
          (SELECT #{iddi}, id, dmed#{cont}, urlev#{cont} 
           FROM cor1440_gen_pmindicadorpf WHERE 
           mindicadorpf_id IN (SELECT id FROM  cor1440_gen_mindicadorpf
           WHERE indicadorpf_id = #{ind}));"
        puts e
        byebug
        execute <<-SQL
        #{e}
        SQL
        cont += 1
      end
    end
  end
end
