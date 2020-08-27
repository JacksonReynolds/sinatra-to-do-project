class ListsController < ApplicationController
  
  get "/lists/new" do
    redirect_if_not_logged_in
    erb :"/lists/new"
  end

  get "/lists" do
    redirect_if_not_logged_in
    @lists = current_user.lists
    erb :'lists/index'
  end

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

  get "/lists/:id/edit" do
    redirect_if_not_logged_in
    @list = List.find_by(params)
    owner_error if !check_owner(@list)
    erb :"/lists/edit"
  end

  patch "/lists/:id" do
    redirect_if_not_logged_in
    list = List.find_by(id: params[:id])
    owner_error if !check_owner(list)
    list.update(params[:list])
    redirect "/lists/#{list.id}"
  end

  delete "/lists/:id" do
    redirect_if_not_logged_in
    list = List.find_by(id: params[:id])
    owner_error if !check_owner(list)
    list.delete
    flash[:message] = "#{list.name} deleted!"
    redirect "/lists"
  end
end
