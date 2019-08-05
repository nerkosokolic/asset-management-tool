#only reads  not posts
get '/assets/new' do
    asset_category = Asset.select(:category).distinct
    erb :new
  end
  
  post '/assets' do
    asset = Asset.new
    asset.description = params[:description]
    asset.category = params[:category]
    asset.bu_id = current_user.bu_id
    asset.purchase_date = params[:purchase_date]
    asset.purchase_cost = params[:purchase_cost]
    asset.registration_expiry = params[:rego_expiry]
    asset.save
    redirect '/my_assets'
  end
  
  get '/assets/:id' do
    redirect '/login' unless session[:user_id]
    @asset = Asset.find(params[:id])
    @maintenance = MaintenanceLog.where(asset_id: params[:id])
    @utilisation = UtilisationLog.where(asset_id: params[:id])
    # @comments = Comment.where(asset_id: params[:id])
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
    asset = Asset.find(params[:id])
    asset.description = params[:description]
    asset.category = params[:category]
    asset.save
    redirect "/assets/#{params[:id]}"
  end
  
  delete '/assets/:id' do
    asset = Asset.find(params[:id])
    asset.destroy
    redirect "/my_assets"
  end