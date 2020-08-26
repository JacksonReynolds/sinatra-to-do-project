class ToDosController < ApplicationController

  # GET: /to_dos
  get "/to_dos" do
    redirect_if_not_logged_in
    @lists = current_user.lists
    erb :"/to_dos/index"
  end

  # GET: /to_dos/new
  get "/to_dos/new" do
    redirect_if_not_logged_in
    @to_dos = current_user.to_dos
    @lists = current_user.lists
    erb :"/to_dos/new"
  end

  post '/to_dos' do
    redirect_if_not_logged_in
    to_do = ToDo.create(params[:to_do])
    to_do.save
    redirect "/lists/#{to_do.list_id}"
  end

  get '/to_dos/:id/edit' do
    redirect_if_not_logged_in
    @to_do = ToDo.find_by(params)
    owner_error if !check_owner(@to_do)
    erb :'to_dos/edit'
  end

  patch '/to_dos/:id' do
    redirect_if_not_logged_in
    to_do = ToDo.find_by(id: params[:id])
    owner_error if !check_owner(to_do)
    to_do.update(params[:to_do])
    redirect "/lists/#{session[:working_list_id]}"
  end

  delete '/to_dos/:id' do
    redirect_if_not_logged_in
    to_do = ToDo.find_by(params[:id])
    owner_error if !check_owner(to_do)
    to_do.delete
    flash[:message] = "To do item deleted!"
    redirect "/lists/#{session[:working_list_id]}"
  end

end
