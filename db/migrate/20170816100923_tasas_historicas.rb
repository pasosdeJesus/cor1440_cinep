class TasasHistoricas < ActiveRecord::Migration[5.1]
  def up
    execute <<-SQL
    INSERT INTO tasacambio (fecha, tipomoneda_id, enpesos, observaciones) VALUES ('2016-12-01', '2', 3273, 'http://www.xe.com/currencytables/?from=COP&date=2016-12-01'); --EUR
    INSERT INTO tasacambio (fecha, tipomoneda_id, enpesos, observaciones) VALUES ('2016-12-01', '3', 3078, 'http://www.xe.com/currencytables/?from=COP&date=2016-12-01'); -- USD
    INSERT INTO tasacambio (fecha, tipomoneda_id, enpesos, observaciones) VALUES ('2016-12-01', '4', 3039, 'http://www.xe.com/currencytables/?from=COP&date=2016-12-01'); -- CHF
    INSERT INTO tasacambio (fecha, tipomoneda_id, enpesos, observaciones) VALUES ('2016-12-01', '5', 3876, 'http://www.xe.com/currencytables/?from=COP&date=2016-12-01'); -- GBP
    INSERT INTO tasacambio (fecha, tipomoneda_id, enpesos, observaciones) VALUES ('2016-12-01', '6', 332, 'http://www.xe.com/currencytables/?from=COP&date=2016-12-01'); -- SEK
    INSERT INTO tasacambio (fecha, tipomoneda_id, enpesos, observaciones) VALUES ('2017-02-01', '2', 3126, 'http://www.xe.com/currencytables/?from=COP&date=2017-02-01'); --EUR
    INSERT INTO tasacambio (fecha, tipomoneda_id, enpesos, observaciones) VALUES ('2017-02-01', '3', 2907, 'http://www.xe.com/currencytables/?from=COP&date=2017-02-01'); -- USD
    INSERT INTO tasacambio (fecha, tipomoneda_id, enpesos, observaciones) VALUES ('2017-02-01', '4', 2962, 'http://www.xe.com/currencytables/?from=COP&date=2017-02-01'); -- CHF
    INSERT INTO tasacambio (fecha, tipomoneda_id, enpesos, observaciones) VALUES ('2017-02-01', '5', 3675, 'http://www.xe.com/currencytables/?from=COP&date=2017-02-01'); -- GBP
    INSERT INTO tasacambio (fecha, tipomoneda_id, enpesos, observaciones) VALUES ('2017-02-01', '6', 331, 'http://www.xe.com/currencytables/?from=COP&date=2017-02-01'); -- SEK
    INSERT INTO tasacambio (fecha, tipomoneda_id, enpesos, observaciones) VALUES ('2017-05-01', '2', 3209, 'http://www.xe.com/currencytables/?from=COP&date=2017-05-01'); --EUR
    INSERT INTO tasacambio (fecha, tipomoneda_id, enpesos, observaciones) VALUES ('2017-05-01', '3', 2941, 'http://www.xe.com/currencytables/?from=COP&date=2017-05-01'); -- USD
    INSERT INTO tasacambio (fecha, tipomoneda_id, enpesos, observaciones) VALUES ('2017-05-01', '4', 2955, 'http://www.xe.com/currencytables/?from=COP&date=2017-05-01'); -- CHF
    INSERT INTO tasacambio (fecha, tipomoneda_id, enpesos, observaciones) VALUES ('2017-05-01', '5', 3799, 'http://www.xe.com/currencytables/?from=COP&date=2017-05-01'); -- GBP
    INSERT INTO tasacambio (fecha, tipomoneda_id, enpesos, observaciones) VALUES ('2017-05-01', '6', 333, 'http://www.xe.com/currencytables/?from=COP&date=2017-05-01'); -- SEK
    INSERT INTO tasacambio (fecha, tipomoneda_id, enpesos, observaciones) VALUES ('2017-08-01', '2', 3507, 'http://www.xe.com/currencytables/?from=COP&date=2017-08-01'); --EUR
    INSERT INTO tasacambio (fecha, tipomoneda_id, enpesos, observaciones) VALUES ('2017-08-01', '3', 2973, 'http://www.xe.com/currencytables/?from=COP&date=2017-08-01'); -- USD
    INSERT INTO tasacambio (fecha, tipomoneda_id, enpesos, observaciones) VALUES ('2017-08-01', '4', 3079, 'http://www.xe.com/currencytables/?from=COP&date=2017-08-01'); -- CHF
    INSERT INTO tasacambio (fecha, tipomoneda_id, enpesos, observaciones) VALUES ('2017-08-01', '5', 3926, 'http://www.xe.com/currencytables/?from=COP&date=2017-08-01'); -- GBP
    INSERT INTO tasacambio (fecha, tipomoneda_id, enpesos, observaciones) VALUES ('2017-08-01', '6', 366, 'http://www.xe.com/currencytables/?from=COP&date=2017-08-01'); -- SEK
    SQL
  end
  def down
  end
end
