/* eslint no-console:0 */
console.log('Hola Mundo desde Webpacker')

require('@rails/ujs').start()   // Javascript no intrusivo segun rails
require("@rails/actiontext")
require('turbolinks').start()   // Acelera carga de paginas
require("trix")

import $ from "expose-loader?exposes=$,jQuery!jquery"
import 'popper.js'              // Dialogos emergentes usados por bootstrap
import 'bootstrap'              // Maquetacion y elementos de diseño
import 'chosen-js/chosen.jquery';       // Cuadros de seleccion potenciados
import 'bootstrap-datepicker'
import 'bootstrap-datepicker/dist/locales/bootstrap-datepicker.es.min.js'
import 'jquery-ui'
import 'jquery-ui/ui/widgets/autocomplete'
import 'jquery-ui/ui/focusable'
import 'jquery-ui/ui/data'

var componentRequireContext = require.context("components", true);
var ReactRailsUJS = require("react_ujs");
ReactRailsUJS.useContext(componentRequireContext);
