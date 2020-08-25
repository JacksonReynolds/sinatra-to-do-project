class UsersController < ApplicationController

  get "/users/sign-up" do
    erb :"users/sign-up"
  end

  # POST: /users
  post "/users" do
    new_user = User.create(params[:user])
    redirect "/"
  end

  get "/users/log-in" do
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

  # PATCH: /users/5
  patch "/users/:id" do
    redirect "/users/:id"
  end

  # DELETE: /users/5/delete
  delete "/users/:id/delete" do
    redirect "/users"
  end
end
