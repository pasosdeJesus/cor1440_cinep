class CampoEntrienal2015Sectoractor < ActiveRecord::Migration[5.2]
  def up
    add_column :sip_sectoractor, :entrienal2015, :bool
    if ActiveRecord::Base.connection.table_exists? 'sectoractor'
      execute <<-SQL
        UPDATE sip_sectoractor SET entrienal2015='t' FROM sectoractor 
          WHERE sip_sectoractor.id=sectoractor.id 
          AND sectoractor.enplantrienal
      SQL
    else
      execute <<-SQL
        UPDATE sip_sectoractor SET entrienal2015='t' WHERE
          id IN ('8', '13', '14', '103', '104', '105', '107',
                  '108', '109', '112', '113');
      SQL
    end
  end

  def down
    remove_column :sip_sectoractor, :entrienal2015
  end
end
