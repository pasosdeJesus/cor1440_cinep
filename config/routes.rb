Rails.application.routes.draw do

  scope '/' do
    devise_scope :usuario do
      get 'sign_out' => 'devise/sessions#destroy'
      # El siguiente para superar mala generación del action en el formulario
      # cuando se autentica mal (genera 
      # /puntomontaje/puntomontaje/usuarios/sign_in )
      if (Rails.configuration.relative_url_root != '/') 
        ruta = File.join(Rails.configuration.relative_url_root, 
                         'usuarios/sign_in')
        post ruta, to: 'devise/sessions#create'
        get ruta, to: 'devise/sessions#new'
      end
    end
    devise_for :usuarios, :skip => [:registrations], module: :devise
    as :usuario do
      get 'usuarios/edit' => 'devise/registrations#edit', 
        :as => 'editar_registro_usuario'    
      put 'usuarios/:id' => 'jn316_gen/registrations#update', 
        :as => 'registro_usuario'            
    end
    #    get '/usuarios', to: 'jn316_gen/usuarios#index', as: 'usuarios_path'
    #    get '/usuarios/:id/edita', to: 'jn316_gen/usuarios#edit', as: 'edit_usuario_path'
    #    get '/usuarios/:id', to: 'jn316_gen/usuarios#show', as: 'usuario_path'

    resources :usuarios, 
      controller: 'usuarios',
      path_names: { new: 'nuevo', edit: 'edita' }

    resources :acps,
      path_names: { new: 'nueva', edit: 'edita' }

    get '/busqsunif' => 'busqsunif#index', as: :busqsunif

    resources :convenios,
      path_names: { new: 'nueva', edit: 'edita' }
 
    get '/lss/verificacsv' => 'lss#verificacsv',
      as: :lss_verificacsv
    post '/lss/verificacsv' => 'lss#verificacsv', 
      as: :lss_envia_verificacsv

    resources :lss,
      path_names: { new: 'nueva', edit: 'edita' }

    resources :mindicadorespf,
      controller: 'cor1440_gen/mindicadorespf', 
      path_names: { new: 'nuevo', edit: 'edita' }

    resources :pprogstind, path_names: { new: 'nuevo', edit: 'edita' }

#    resources :proyectosfinancieros, 
#      controller: 'cor1440_gen/proyectosfinancieros', 
#      path_names: { new: 'nuevo', edit: 'edita' }

    resources :tasascambio,
      path_names: { new: 'nueva', edit: 'edita' }

    get "/admin/grupos/:id/creardirac" => "sip/admin/grupos#crear_dirac", as: :crear_dirac

    get "/admin/grupos/arbol" => "sip/admin/grupos#arbol", as: :grupos_arbol

    get "/admin/grupos/coordinadores" => "sip/admin/grupos#coordinadores", 
      as: :grupos_coordinadores

    get "/admin/grupos/procesosgh" => "sip/admin/grupos#procesosgh", 
      as: :grupos_procesosgh

    get "/admin/grupos/supragrupos" => "sip/admin/grupos#supragrupos", 
      as: :grupos_supragrupos

    get "/admin/profesiones/:id/areaestudios" => "admin/profesiones#areaestudios", 
      as: :profesiones_areaestudios

    get "/admin/tiposcontratos/:id/tiponomina" => "admin/tiposcontratos#tiponomina", 
      as: :tiposcontratos_areaestudios

    get "/encuestapersona/:id/correoinv" => "mr519_gen/encuestaspersona#correoinv", 
      as: :correoinv_encuestapersona

    get '/comunicados/presenta/:nombre' => 'admin/comunicados#presenta',
      as: :comunicado_presenta

    get "/api/cor1440cinep/duracion" => 
      "cor1440_gen/proyectosfinancieros#duracion", 
      as: :duracion 
    get "/api/cor1440cinep/mideindicador" => 
      "cor1440_gen/mindicadorespf#mideindicador", 
      as: :mideindicador

    get '/confytransf' => 
      'sip/hogar#confytransf',
      as: :confytransf

    get '/dinamicasconflicto' => 
      'sip/hogar#dinamicasconflicto',
      as: :dinamicasconflicto


  get '/encuestasusuario/externoresultado/:adurl' => 
    "mr519_gen/encuestasusuario#externoresultado",
    as: :externoresultado_encuestausuario


    get "/proyectosfinancieros/:id/fichaimp" => "cor1440_gen/proyectosfinancieros#fichaimp", as: :pf_fichaimp
    get "/proyectosfinancieros/:id/fichapdf" => "cor1440_gen/proyectosfinancieros#fichapdf", as: :pf_fichapdf

    get "/reportes/indicador11" => "reportes#indicador11", 
      as: :reportes_indicador11
    get "/reportes/objetivoe2" => "reportes#objetivoe2", 
      as: :reportes_objetivoe2
    get "/reportes/cuadroactividades" => "reportes#cuadroactividades", 
      as: :reportes_cuadroactividades


    namespace :admin do
      ab = ::Ability.new
      ab.tablasbasicas.each do |t|
        if (t[0] == "") 
          c = t[1].pluralize
          resources c.to_sym, 
            path_names: { new: 'nueva', edit: 'edita' }
        end
      end
    end
    # No poner mount aqui para evitar bug en tablas definidas en
    # la aplicación que desde sus vistas daran actividades_path en /actividades
    # en lugar de /act/actividades

    get '/maps/WORLD' => 'mapatiempo#worldjson', 
             :as => 'worldjson'
    get '/maps/gadm36_COL_1' => 'mapatiempo#colombia', 
             :as => 'colombia'
    get '/casos/mapatiempo' => 'mapatiempo#mapatiempo', 
             :as => 'mapatiempo'
    get '/casos/mapatiempo/datoscovid' => 'mapatiempo#datoscovid', 
             :as => 'mapatiempocovid'

    # Se define root aqui para que tras ingresos y salidas llegue a root
    root 'sip/hogar#index'
  end
  mount Cor1440Gen::Engine, at: "/", as: "cor1440_gen"
  mount Sal7711Ld::Engine, at: "/", as: "sal7711_ld"
  mount Jn316Gen::Engine, at: "/", as: "jn316_gen"
  mount Mr519Gen::Engine, at: "/", as: "mr519_gen"
  mount Heb412Gen::Engine, at: "/", as: "heb412_gen"
  mount Sip::Engine, at: "/", as: "sip"

  get '/' => 'redirige#index'
end
