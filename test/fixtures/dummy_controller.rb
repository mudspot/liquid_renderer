

class DummyController < ActionController::Base
  include LiquidRenderer::Controller

  liquid_filter :extra_liquid, 'other_liquid'
  liquid_filter LiquidFilters::AnotherLiquidFilter
end


