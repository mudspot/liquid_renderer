require 'liquid'
require "action_view/template"

module LiquidRenderer
  require 'liquid_renderer/version'
  require 'liquid_renderer/renderer'
end

ActionView::Template.register_template_handler :liquid, LiquidRenderer::Renderer