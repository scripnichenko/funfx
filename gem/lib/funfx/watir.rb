require 'rubygems'
require 'watir'
require 'funfx/flex/generated_elements'

module Watir
  module Container
    # An HTML element hosting a Flex app.
    class FlexApp < Element
      include FunFX::Flex

      def initialize(ole_object, dom_id)
        super(ole_object)
        @flex_object = ole_object.ie.Document.getElementsByName(dom_id).item(0)
      end
      
      def fire_event(flex_id, type, value) # :nodoc:
        @flex_object.fireFunFXEvent(flex_id, type, value)
      end

      def get_property_value(flex_id, property) # :nodoc:
        @flex_object.getFunFXPropertyValue(flex_id, property)
      end
    end

    # Returns a FlexApp identified by +dom_id+
    def flex_app(dom_id)
      FlexApp.new(self, dom_id)
    end
  end
end