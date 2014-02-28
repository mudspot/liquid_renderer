require 'test_helper'

class NavigationTest < ActiveSupport::IntegrationCase
  test '.liquid tempate handler' do
    visit '/home/index'
    assert_match 'this page uses liquid extension!', page.body
  end

  test '.liquid variables' do
    visit '/home/index?name=Rodrigo'
    assert_match 'Rodrigo this page uses liquid extension!', page.body
  end

  test 'renders layout file with .liquid extension' do
    visit '/home/hello'
    assert_match 'Dummy App', page.body
    assert_match 'Hello', page.body
  end

  test 'renders with local assings' do
    visit '/home/bye?name=Rodrigo'
    assert_match 'Bye Rodrigo!', page.body
  end

  test 'uses default Filter' do
    visit '/home/filter?name=Rodrigo%20Ra'
    assert_match 'RodrigoRa', page.body
  end

  test 'uses extra filter' do
    visit '/home/extra?text=TEXT'
    assert_match "Extra: TEXT", page.body
  end


  test 'renders liquid without include LiquidRenderer::Controller module' do
    visit '/liquid/index'
    assert_match 'It works!', page.body
  end

end
