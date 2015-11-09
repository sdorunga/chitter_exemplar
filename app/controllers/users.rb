class Chitter < Sinatra::Base
  get "/users/new" do
    erb :"users/new"
  end

  post "/users" do
    user = User.new(email: params[:email],
             password: params[:password],
             password_confirmation: params[:password_confirmation],
             name: params[:name],
             username: params[:username])
    if user.save
      session[:user_id] = user.id
      flash.next[:notice] = "Logged in as: #{current_user && current_user.username}"
    end

    redirect "/"
  end
end
