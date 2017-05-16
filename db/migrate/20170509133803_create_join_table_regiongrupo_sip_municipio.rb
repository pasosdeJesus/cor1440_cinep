class CreateJoinTableRegiongrupoSipMunicipio < ActiveRecord::Migration[5.0]
  def change
    create_join_table :regiongrupo, :sip_municipio do |t|
      # t.index [:regiongrupo_id, :sip_municipio_id]
      # t.index [:sip_municipio_id, :regiongrupo_id]
    end
  end
end
