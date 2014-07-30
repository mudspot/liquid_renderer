
class WithExtraRegistersController < ActionController::Base
  include LiquidRenderer::Controller

  liquid_filter :extra_liquid, 'other_liquid'
  liquid_filter LiquidFilters::AnotherLiquidFilter

  liquid_register :extra_register

  private

  def extra_register
    { extra_register: 'any variable' }
  end

end