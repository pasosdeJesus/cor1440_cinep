# encoding: UTF-8

require 'net/http'
require 'json'

class TasascambioController < Sip::ModelosController
  helper ::ApplicationHelper
  #include ::ApplicationHelper
  #include ::Sip::ModeloHelper
  #include ::Sip::ConsultasHelper

  before_action :set_tasacambio, 
    only: [:show, :edit, :update, :destroy]
  load_and_authorize_resource class: ::Tasacambio

  def clase
    "::Tasacambio"
  end

  def atributos_index
    [ "id", 
      "fecha_localizada",
      "tipomoneda_id",
      "enpesos_localizado",
      "observaciones"
    ] 
  end

  
  def filtrar(cons, params)
    if params[:aniomax] && params[:mesmax]
      cons = cons.where("fecha<='#{params[:aniomax].to_i}-#{params[:mesmax].to_i}-01'")
    end
    return super(cons, params)
  end

  def index_reordenar(registros)
    return registros.reorder(fecha: :desc, tipomoneda_id: :asc)
  end

  def new_modelo_path(o)
    return new_tasacambio_path()
  end

  def genclase
    return 'F'
  end

  def new
    url = 'http://www.apilayer.net/api/live?access_key=a9831f6952fcc74b74af769cb44394cf&format=1&currencies=COP,SEK,EUR,CHF,GBP'
    uri = URI(url)
    response = Net::HTTP.get(uri)
    j=JSON.parse(response)
    @div = {}
    @div['USD'] = j['quotes']['USDCOP'].to_f
    @div['SEK'] = @div['USD'] / j['quotes']['USDSEK'].to_f
    @div['EUR'] = @div['USD'] / j['quotes']['USDEUR'].to_f
    @div['CHF'] = @div['USD'] / j['quotes']['USDCHF'].to_f
    @div['GBP'] = @div['USD'] / j['quotes']['USDGBP'].to_f
    super
  end

  private

  def set_tasacambio
    @registro = @basica = @tasacambio = ::Tasacambio.find(
      Tasacambio.connection.quote_string(params[:id]).to_i
    )
  end

  # No confiar parametros a Internet, sólo permitir lista blanca
  def tasacambio_params
    params.require(:tasacambio).permit([
      :enpesos_localizado,
      :fecha_localizada,
      :observaciones,
      :tipomoneda_id
    ])
  end
end
