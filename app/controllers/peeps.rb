class Chitter < Sinatra::Base
  get "/peeps/new" do
    if current_user
      erb :"peeps/new"
    else
      flash.next[:notice] = "You must be signed in to post peeps"
      redirect "/" 
    end
  end
end
