class Chitter < Sinatra::Base
  get "/peeps/new" do
    if current_user
      erb :"peeps/new"
    else
      flash.next[:notice] = "You must be signed in to post peeps"
      redirect "/"
    end
  end

  post "/peeps" do
    Peep.create(content: params[:peep], user_id: current_user.id)
    redirect "/peeps"
  end

  get "/peeps" do
    @peeps = Peep.all
    erb :"peeps/index"
  end
end
