require 'liquid_filters/dummy_filter'
require 'liquid_filters/other_liquid_filter'
require 'liquid_filters/another_liquid_filter'
require 'liquid_filters/extra_liquid_filter'

class DummyController < ActionController::Base
  include LiquidRenderer::Controller

  liquid_filter :extra_liquid, 'other_liquid'
  liquid_filter LiquidFilters::AnotherLiquidFilter
end