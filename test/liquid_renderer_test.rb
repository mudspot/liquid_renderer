require 'test_helper'
require 'fixtures/dummy_controller'



class LiquidRendererTest < ActiveSupport::TestCase
  test "Controller Module load" do
    assert_kind_of Module, LiquidRenderer::Controller
  end

  test 'Controller Module included' do
    assert ActionController::Base.ancestors.include? LiquidRenderer::Controller
  end

  test 'Methods added to ActionController::Base' do
    assert_respond_to DummyController, :add_liquid_filters
    assert_respond_to DummyController, :liquid_filters
  end

  test 'Filter added to Controller' do
    assert_equal DummyController.liquid_filters.class, Array
    assert_equal DummyController.liquid_filters, [DummyFilter]
  end
end
