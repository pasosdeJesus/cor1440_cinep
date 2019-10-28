class AgregaEvidenciacorreoinvEncuestapersona < ActiveRecord::Migration[6.0]
  def change
    add_column :mr519_gen_encuestapersona, :destcorreoinv, :string, limit: 2048
    add_column :mr519_gen_encuestapersona, :evidenciacorreoinv, :string, limit: 256
  end
end
