class ToDosController < ApplicationController

  # GET: /to_dos
  get "/to_dos" do
    erb :"/to_dos/index.html"
  end

  # GET: /to_dos/new
  get "/to_dos/new" do
    erb :"/to_dos/new.html"
  end

  # POST: /to_dos
  post "/to_dos" do
    redirect "/to_dos"
  end

  # GET: /to_dos/5
  get "/to_dos/:id" do
    erb :"/to_dos/show.html"
  end

  # GET: /to_dos/5/edit
  get "/to_dos/:id/edit" do
    erb :"/to_dos/edit.html"
  end

  # PATCH: /to_dos/5
  patch "/to_dos/:id" do
    redirect "/to_dos/:id"
  end

  # DELETE: /to_dos/5/delete
  delete "/to_dos/:id/delete" do
    redirect "/to_dos"
  end
end
