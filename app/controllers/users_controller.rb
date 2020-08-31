
class UsersController < ApplicationController

  get "/sign-up" do
    if current_user
      redirect '/'
    end
    erb :"users/sign-up"
  end

  post "/sign-up" do
    user = User.new(params[:user])
    if user.valid?
      user.save
      session[:user_id] = user.id
      redirect "/"
    else
      flash[:message] = user.errors.full_messages
      erb :"users/sign-up"
    end
  end

  get "/log-in" do
    erb :"users/log-in"
  end

  post '/log-in' do
    @user = User.find_by(username: params[:user][:username])
    if @user && @user.authenticate(params[:user][:password])
      session[:user_id] = @user.id
      redirect '/'
    else
      flash[:message] = "Invalid Login"
      erb :"users/log-in"
    end
  end

  get '/log-out' do
    session.clear
    redirect '/'
  end

end
