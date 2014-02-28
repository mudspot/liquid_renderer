# liquid_renderer

LiquidRenderer adds liquid renderer and option to include liquid filters .

To use it, add this line to your Gemfile:

    gem "liquid_renderer"


## How to use

### Rendering views
Just create `.liquid` files inside your `app/views` directory.


### Using filters

Creates liquid_filters folder inside your app directory and adds filters using same naming convention of Rails helpers.

    class HomeController < ApplicationController
      include LiquidRenderer::Controller
    end

    mudule LiquidFilters::HomeFilter
      # this filter will be used to render HomeController views
    end


### Code Status


### License

Ruby license or MIT license, take your pick.