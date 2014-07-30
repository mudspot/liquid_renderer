module LiquidRenderer

  module Controller
    extend ActiveSupport::Concern

    included do
      class_attribute :_liquid_filters
      class_attribute :_liquid_registers
      self._liquid_filters = Module.new
      self._liquid_registers = []

      default_liquid_module! unless anonymous?
    end

    module ClassMethods

      def liquid_filter(*args)
        modules_for_liquid_filters(args).each do |mod|
          add_liquid_template_filter(mod)
        end
      end

      def liquid_filters
        _liquid_filters
      end

      def liquid_register(extra_register_method)
        _liquid_registers << extra_register_method
      end

      def liquid_registers
        _liquid_registers
      end

      private

      # Returns a list of modules, normalized from the acceptable kinds of
      # helpers with the following behavior:
      #
      # String or Symbol:: :FooBar or "FooBar" becomes "foo_bar_helper",
      #   and "foo_bar_helper.rb" is loaded using require_dependency.
      #
      # Module:: No further processing
      #
      # After loading the appropriate files, the corresponding modules
      # are returned.
      #
      # ==== Parameters
      # * <tt>args</tt> - An array of helpers
      #
      # ==== Returns
      # * <tt>Array</tt> - A normalized list of modules for the list of
      #   helpers provided.
      def modules_for_liquid_filters(args)
        args.flatten.map! do |arg|
          case arg
          when String, Symbol
            file_name = "liquid_filters/#{arg.to_s.underscore}_filter"
            require_dependency(file_name, "Missing liquid file %s.rb")
            file_name.camelize.constantize
          when Module
            arg
          else
            raise ArgumentError, "filter must be a String, Symbol, or Module"
          end
        end
      end

      def add_liquid_template_filter(mod)
        _liquid_filters.module_eval { include mod }
      end

      def default_liquid_module!
        module_name = name.sub(/Controller$/, '')
        module_path = module_name.underscore
        liquid_filter module_path
      rescue MissingSourceFile => e
        raise e unless e.is_missing? "liquid_filters/#{module_path}_filter"
      rescue NameError => e
        raise e unless e.missing_name? "#{module_name}Filter"
      end

    end #end ClassMethods

  end #end Controller

end #end LiquidRenderer


#ActionController::Base.send(:include, LiquidRenderer::Controller)