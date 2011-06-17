class RubyShift < Sinatra::Base
  set :root,   File.dirname(__FILE__)
  set :public, File.join(root, 'public')

  get '/' do
    erb(:index)
  end
end
