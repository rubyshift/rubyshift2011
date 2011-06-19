class RubyShift < Sinatra::Base
  set :root,   File.dirname(__FILE__)
  set :public, File.join(root, 'public')

  use Rack::Auth::Basic, "Restricted Area" do |username, password|
    username == 'foo'
  end

  get '/' do
    erb(:index)
  end

  get '/visa' do
    if params[:country]
      response = HTTParty.get("http://visamap.net/api/rules/#{params[:country]}.json?country=ua")
    else
      response = HTTParty.get("http://visamap.net/api/rules.json?country=ua&ip=#{request.ip}")
    end

    response#['visa_type']['title']
  end
end
