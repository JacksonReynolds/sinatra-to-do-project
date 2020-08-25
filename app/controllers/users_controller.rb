class UsersController < ApplicationController

  get "/sign-up" do
    if current_user
      redirect '/'
    end
    erb :"users/sign-up"
  end

  post "/sign-up" do
    user = User.create(params[:user])
    if user.valid?
      session[:user_id] = user.id
      redirect "/"
    else
      flash[:message] = user.errors.full_messages
      erb :'users/sign-up'
    end
  end

  get "/log-in" do
    erb :"users/log-in"
  end

  # GET: /users/5
  get "/users/:id" do
    erb :"/users/show.html"
  end

  # GET: /users/5/edit
  get "/users/:id/edit" do
    erb :"/users/edit.html"
  end

end
