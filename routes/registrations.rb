get '/register' do
    @bu = BusinessUnit.all
    erb :register
end

post '/register' do
    user = User.new
    user.email = params[:email]
    user.password = params[:password]
    user.bu_id = params[:bu]
    # bu_id = BusinessUnit.find_by(bu_name: params[:bu]).id
    user.save
    redirect '/login'

    # dish.user_id = current_user.id
    # dish.save
    # redirect '/'
  end