module LiquidRenderer

  module Controller
    extend ActiveSupport::Concern

    included do
      class_attribute :_liquid_filters
      self._liquid_filters ||= []
    end

    module ClassMethods

      def add_liquid_filters *args
        _liquid_filters.concat args.flatten
      end

      def liquid_filters
        _liquid_filters
      end
    end
  end
end


ActionController::Base.send(:include, LiquidRenderer::Controller)