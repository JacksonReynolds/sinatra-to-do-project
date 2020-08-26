class ListsController < ApplicationController
  
  # GET: /lists/new
  get "/lists/new" do
    redirect_if_not_logged_in
    erb :"/lists/new"
  end

  get "/lists" do
    redirect_if_not_logged_in
    @lists = current_user.lists
    erb :'lists/index'
  end

  # POST: /lists
  post "/lists" do
    redirect_if_not_logged_in
    list = List.create(params[:list])
    list.user_id = session[:user_id]
    list.save
    redirect "/lists"
  end

  get "/lists/:id" do
    redirect_if_not_logged_in
    @list = List.find_by(params)
    owner_error if !check_owner(@list)
    session[:working_list_id] = @list.id
    erb :"/lists/show"
  end

  # GET: /lists/5/edit
  get "/lists/:id/edit" do
    redirect_if_not_logged_in
    @list = List.find_by(params)
    owner_error if !check_owner(@list)
    erb :"/lists/edit"
  end

  # PATCH: /lists/5
  patch "/lists/:id" do
    redirect_if_not_logged_in
    # binding.pry
    list = List.find_by(id: params[:id])
    owner_error if !check_owner(list)
    list.update(params[:list])
    redirect "/lists/#{list.id}"
  end

  # DELETE: /lists/5/delete
  delete "/lists/:id" do
    redirect_if_not_logged_in
    list = List.find_by(id: params[:id])
    owner_error if !check_owner(list)
    list.delete
    flash[:message] = "#{list.name} deleted!"
    redirect "/lists"
  end
end
