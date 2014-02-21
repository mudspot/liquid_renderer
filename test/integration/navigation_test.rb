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
  end

end
