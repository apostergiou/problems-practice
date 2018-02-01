require 'rack'

class ParamsParser
  def initialize(app)
    @app = app
  end

  def call(env)
    request = Rack::Request.new env
    env['params'] = request.params
    app.call env
  end
end

class HelloWorldApp
  def self.call(env)
    [200, {}, env['params'].inspect]
  end
end

class First
  def initialize(app)
    @app = app
  end

  def call(env)
    puts :first
    @app.call(env).tap { |_| puts :first_2 }
  end
end

class Second
  def initialize(app)
    @app = app
  end

  def call(env)
    puts :second

    status, headers, body = @app.call(env).tap { |_| puts :second_2 }
    [status, headers, body]
  end
end

app = Rack::Builder.new do
  use First
  use Second
  run HelloWorldApp
end

Rack::Server.start :app => app
