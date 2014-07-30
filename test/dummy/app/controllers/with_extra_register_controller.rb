class WithExtraRegisterController < ApplicationController
  include LiquidRenderer::Controller

  liquid_register :extra_register

  def index
    @name = params[:name]
  end

  private

  def extra_register
    { message: 'hello world' }
  end

end