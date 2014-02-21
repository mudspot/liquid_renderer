class ActiveSupport::IntegrationCase < ActiveSupport::TestCase
  include Capybara::DSL
  include Rails.application.routes.url_helpers


  test '.liquid tempate handler' do
    visit '/home/index'
    assert_match 'this page uses liquid extension!', page.body
  end

  test '.liquid variables' do
    visit '/home/index?name=Rodrigo'
    assert_match 'Rodrigo this page uses liquid extension!', page.body
  end
end