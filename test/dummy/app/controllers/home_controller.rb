class HomeController < ApplicationController

  def index
    @name = params[:name]
  end

  def hello
    render layout: 'liquid'
  end

  def bye
    render layout: 'liquid', locals: { name: params[:name] }
  end
end