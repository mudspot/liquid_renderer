require 'test_helper'
require 'fixtures/dummy_controller'

class LiquidRendererTest < ActiveSupport::TestCase
  test "Controller Module load" do
    assert_kind_of Module, LiquidRenderer::Controller
  end

  test 'Methods added to ActionController::Base' do
    assert_respond_to DummyController, :liquid_filter
    assert_respond_to DummyController, :liquid_filters
  end

  test 'add default filter to controller' do
    assert_equal Module, DummyController.liquid_filters.class
    assert DummyController.liquid_filters.ancestors.include?(LiquidFilters::DummyFilter),
           'DummyController should include LiquidFilters::DummyFilter'
  end

  test 'do not raise error when default filter do not exists' do
    def_class = Proc.new {
      class MyController
        include LiquidRenderer::Controller
      end
    }

    def_class.call
    assert true, 'MyController class should be loaded without error'
  end

  test 'add other filters by symbol' do
    assert DummyController.liquid_filters.ancestors.include?(LiquidFilters::ExtraLiquidFilter),
           'DummyController should include LiquidFilters::ExtraLiquidFilter by symbol'
  end

  test 'add other filters by name' do
    assert DummyController.liquid_filters.ancestors.include?(LiquidFilters::OtherLiquidFilter),
           'DummyController should include LiquidFilters::OtherLiquidFilter by name'
  end

  test 'add other filters by constant' do
    assert DummyController.liquid_filters.ancestors.include?(LiquidFilters::AnotherLiquidFilter),
           'DummyController should include LiquidFilters::AnotherLiquidFilter by constant'
  end
end
