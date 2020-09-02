require './config/environment'
require 'rack-flash'
require 'securerandom'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, 'secret'
    use Rack::Flash
  end

  before(/(\/li).*|(\/to).*/) do
    redirect_if_not_logged_in
  end

  get "/" do
    erb :welcome
  end

  helpers do
    def current_user
      User.find_by(id: session[:user_id])
    end

    def redirect_if_not_logged_in
      if !current_user
        flash[:message] = "Please log in to view that page"
        redirect '/log-in'
      end
    end

    def check_owner(obj)
      obj.user == current_user
    end

    def owner_error
      flash[:message] = "That doesn't belong to you!"
      redirect '/lists'
    end
  end

end
