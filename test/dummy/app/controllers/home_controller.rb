class HomeController < ApplicationController
  include LiquidRenderer::Controller

  liquid_filter :extra

  def index
    @name = params[:name]
  end

  def hello
    render layout: 'liquid'
  end

  def bye
    render layout: 'liquid', locals: { name: params[:name] }
  end

  def filter
    @name = params[:name]
  end

  def extra
    @text = params[:text]
  end
end