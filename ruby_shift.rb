class RubyShift < Sinatra::Base
  set :root,   File.dirname(__FILE__)
  set :public, File.join(root, 'public')

  use Rack::Auth::Basic, "Restricted Area" do |username, password|
    username == 'foo'
  end

  get '/' do
    erb(:index)
  end
end
