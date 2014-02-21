require 'fixtures/dummy_filter'

class DummyController < ActionController::Base

  add_liquid_filters DummyFilter

end