module LiquidRenderer

  # http://royvandermeij.com/blog/2011/09/21/create-a-liquid-handler-for-rails-3-dot-1/
  class Renderer

    def initialize(view)
      @view = view
    end

    def self.call(template)
      "LiquidRenderer::Renderer.new(self).render(#{template.source.inspect}, local_assigns)"
    end

    def render(template, local_assigns = {})
      _set_default_content_type
      assigns = _merge_assigns(local_assigns)
      liquid = Liquid::Template.parse(template)
      liquid.render(assigns, filters: _filters, registers: _registers)
    end

    def compilable?
      false
    end

    private

    def _set_default_content_type
      _controller.headers["Content-Type"] ||= 'text/html; charset=utf-8'
    end

    def _merge_assigns(local_assigns)
      assigns = @view.assigns
      assigns["content_for_layout"] = @view.content_for(:layout) if @view.content_for?(:layout)
      assigns.merge!(local_assigns.stringify_keys)
    end

    def _controller
      @view.controller
    end

    def _filters
      if _controller.class.ancestors.include? Controller
        _controller._liquid_filters
      else
        []
      end
    end

    def _registers
      extra_registers = {}
      if _controller.class.respond_to? :liquid_registers
        _controller.class.liquid_registers.each do |method|
          extra_registers.merge! _controller.send(method)
        end
      end
      {action_view: @view, controller: _controller}.merge extra_registers
    end
  end
end

ActionView::Template.register_template_handler :liquid, LiquidRenderer::Renderer

