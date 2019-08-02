#only reads  not posts
get '/assets/new' do
    erb :new
  end
  
  post '/assets' do
    asset = Dish.new
    asset.title = params[:title]
    asset.image_url = params[:image_url]
    asset.user_id = current_user.id
    asset.save
    redirect '/'
  end
  
  get '/assets/:id' do
    redirect '/login' unless session[:user_id]
    @asset = Dish.find(params[:id])
    @comments = Comment.where(asset_id: params[:id])
    erb :show
  end
  
  # to view the edit form
  get '/assets/:id/edit' do
     @asset = Asset.find(params[:id])
    erb :edit
  end
  
  #update existing asset
  put '/assets/:id' do
    #grab existing asset
    asset = Dish.find(params[:id])
    asset.title = params[:title]
    asset.image_url = params[:image_url]
    asset.save
    redirect "/assets/#{params[:id]}"
  end
  
  delete '/assets/:id' do
    asset = Dish.find(params[:id])
    asset.destroy
    redirect "/"
  end