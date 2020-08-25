require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, "secret"
  end

  register Sinatra::Flash

  get "/" do
    erb :welcome
  end

  module Helpers
    def current_user
      User.find_by(id: session[:user_id])
    end

    def redirect_if_not_logged_in
      if !current_user
        flash[:message] = "Please log in to view that page"
        redirect '/log-in'
      end
    end
  end

end
