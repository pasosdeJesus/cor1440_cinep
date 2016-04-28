# encoding: UTF-8

require 'test_helper'

class ApplicationHelperTest < ActionView::TestCase
  include ApplicationHelper

  test "dif_meses_dias" do
    d = dif_meses_dias(Date.new(2016, 03, 01), Date.new(2016, 06, 30)) 
    puts d
    assert d == '3 meses y 29 días'
  end
end

#def dif_meses_dias(fechaini, fechafin) 
#    m = 0
#    d = 0
#    if fechaini < fechafin
#      if (fechafin.month < fechaini.month)
#        m = (fechafin.year - fechaini.year - 1)*12
#        m += 12 - fechaini.month + fechafin.month
#      else
#        m = (fechafin.year - fechaini.year)*12
#        m += fechafin.month - fechaini.month
#      end
#      if (fechafin.day < fechaini.day)
#        m = m - 1
#        d = fechaini.end_of_month.day - fechaini.day + fechafin.day
#      else
#        d = fechafin.day - fechaini.day
#      end
#    end
#    if (m == 0) then
#      return d.to_s + " días"
#    elsif (d == 0) then
#      return m.to_s + " meses"
#    end
#    return (m.to_s + " meses y " + d.to_s + " días")
#  end
#
