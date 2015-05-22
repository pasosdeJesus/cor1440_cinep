
Rails.application.routes.draw do

	scope '/act' do
		devise_scope :usuario do
			get 'sign_out' => 'devise/sessions#destroy'
		end
		devise_for :usuarios, :skip => [:registrations], module: :devise
		as :usuario do
			get 'usuarios/edit' => 'devise/registrations#edit', 
				:as => 'editar_registro_usuario'    
			put 'usuarios/:id' => 'devise/registrations#update', 
				:as => 'registro_usuario'            
		end
		resources :usuarios, path_names: { new: 'nuevo', edit: 'edita' } 

    namespace :admin do
      Ability.tablasbasicas.each do |t|
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
		root 'cor1440_gen/hogar#index'
	end
	mount Sip::Engine, at: "/act", as: "sip"
	mount Cor1440Gen::Engine, at: "/act", as: "cor1440_gen"

  get '/' => 'redirige#index'
end
