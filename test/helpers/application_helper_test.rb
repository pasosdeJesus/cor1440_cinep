# encoding: UTF-8

require 'test_helper'

class ApplicationHelperTest < ActionView::TestCase
  include ApplicationHelper

  test "dif_meses_dias" do
    d = dif_meses_dias(Date.new(2016, 03, 01), Date.new(2016, 06, 30)) 
    puts d
    assert d == '4 meses'
  end
end


