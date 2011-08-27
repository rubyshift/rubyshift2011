class RubyShift < Sinatra::Base
  configure do
    Compass.add_project_configuration(File.join(Sinatra::Application.root, 'compass.config'))
  end

  set :root,   File.dirname(__FILE__)
  set :public, File.join(root, 'public')

  get '/' do
    erb(:index)
  end

  get '/screen.css' do
    scss :screen, Compass.sass_engine_options
  end
end
