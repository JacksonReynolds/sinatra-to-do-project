class ToDosController < ApplicationController

  get "/to_dos" do
    @lists = current_user.lists
    erb :"/to_dos/index"
  end

  get "/to_dos/new" do
    @lists = current_user.lists
    erb :"/to_dos/new"
  end

  post '/to_dos' do
    to_do = ToDo.create(params[:to_do])
    to_do.save
    redirect "/lists/#{to_do.list_id}"
  end

  get '/to_dos/:id/edit' do
    @to_do = ToDo.find_by(params)
    owner_error if !check_owner(@to_do)
    erb :'to_dos/edit'
  end

  patch '/to_dos/:id' do
    to_do = ToDo.find_by(id: params[:id])
    owner_error if !check_owner(to_do)
    to_do.update(params[:to_do])
    redirect "/lists/#{session[:working_list_id]}"
  end

  delete '/to_dos/:id' do
    to_do = ToDo.find_by(id: params[:id])
    owner_error if !check_owner(to_do)
    to_do.delete
    flash[:message] = "To do item deleted!"
    redirect "/lists/#{session[:working_list_id]}"
  end

end
