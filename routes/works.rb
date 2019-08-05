post '/works' do
    redirect '/login' unless session
    m = MaintenanceLog.new
    m.asset_id = params[:asset_id]
    m.maintenance_type_id = params[:type]
    m.expense_value = params[:value_spent]
    m.user_id = current_user.bu_id
    m.date_time = Time.now()
    m.save
    redirect "/assets/#{params[:asset_id]}"
  end