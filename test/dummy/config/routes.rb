Dummy::Application.routes.draw do
  get 'home/index'
  get 'home/hello'
  get 'home/bye'
  get 'home/filter'
  get 'home/extra'

  get 'liquid/index'

  get 'with_extra_register/index'
end
