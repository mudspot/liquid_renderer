# liquid_renderer

LiquidRenderer adds liquid renderer and option to include liquid filters like Rails helpers.

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


Create filters inside `app/helpers/liquid_filters` directory

    module LiquidFilters::HomeFilter
      # this filter will be used to render HomeController views
    end


## Code Status


## Contributors

Reference:

- http://royvandermeij.com/blog/2011/09/21/create-a-liquid-handler-for-rails-3-dot-1/
- http://pragprog.com/book/jvrails/crafting-rails-applications







## License

MIT license
