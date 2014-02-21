class HomeController < ApplicationController

  def index
    @name = params[:name]
  end

  def hello
    render layout: 'liquid'
  end
end