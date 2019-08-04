require_relative 'database_config'
require_relative 'models/user'
require_relative 'models/business_unit'
require_relative 'models/asset'
require_relative 'models/revenue_type'
require_relative 'models/maintenance_log'
require_relative 'models/utilisation_log'
#                               Asset Seed
asset_type = {
    :Forklift => ["Active <1T","Aisle 1T - 3T","Ausa 3T-5T","BT 3T-5T","BYD 3T-5T","Caterpillar 3T-5T","Clark 3T-5T","Combilift >5T","Crown <1T","Enforcer >5T","Ep >5T","Ep 3T-5T","Eurolifter <1T","Flexi <1T","Hangcha 3T-5T","Heli 3T-5T","Hyster >5T","Hyundai <1T","Hyworth 3T-5T","Jcb 3T-5T","JIALIFT 1T - 3T","Jlg >5T","Jungheinrich >5T","Kalmar 1T - 3T","Komatsu <1T","Mast 3T-5T","Maximal 3T-5T","Mitsubishi >5T","MLA 3T-5T","Nichiyu 3T-5T","Nissan >5T","Noblelift 3T-5T","Not >5T","Omega >5T","Raymond <1T","Royal >5T","SMV 1T - 3T","Tcm 1T - 3T","Teu 1T - 3T","Toyota <1T","Utilev >5T","Vaclift 3T-5T","Victory 3T-5T","Yale 1T - 3T"],
    :Excuvator => ["Airman 10T - 20T","Bobcat >50T","Case 20T - 50T","Caterpillar >50T","Doosan 20T - 50T","Hitachi <10T","Hyundai 20T - 50T","Jcb 20T - 50T","Kobelco 20T - 50T","Komatsu 20T - 50T","Kubota 10T - 20T","Mecalac 10T - 20T","Nante <10T","New >50T","Rhinoceros >50T","Sany 20T - 50T","Sumitomo <10T","Takeuchi >50T","Volvo 20T - 50T","Wacker 20T - 50T","Yanmar >50T","Yuchai <10T"],
    :Crane => ["Demag <50T","Franna <50T","Grove <50T","Hitachi <50T","James 100T - 200T","Jec 100T - 200T","Kato 100T - 200T","Kobelco >200T","Komatsu >200T","Liebherr 50T - 100T","Linmac 100T - 200T","Maeda 50T - 100T","Manitowoc <50T","Ormig <50T","Perry 100T - 200T","Ppm <50T","Tadano >200T","Terex 50T - 100T","Terex <50T","Terex 100T - 200T","Xcmg 100T - 200T"],
    :Mixer => ["Zoomlion 100T - 200T","BMAC 20KL - 50KL","Bunker >50KL","Cement >50KL","Dieci <10KL","Dimas <10KL","Easymix <10KL","Farmtec 10KL - 20KL","Fiori 20KL - 50KL","Ford 20KL - 50KL","Freightliner 20KL - 50KL","IMER 20KL - 50KL","Iveco 20KL - 50KL","Jacon >50KL","Mack >50KL","Not 10KL - 20KL","Putzmeister <10KL","Rok 20KL - 50KL","Sterling >50KL","Uromac >50KL","Wel 20KL - 50KL"],
    :Loader => ["Active 200 - 500T","Agrison 100T - 200T","Avant 100T - 200T","Bobcat 200 - 500T","Case <100T","Caterpillar 200 - 500T","Gehl <100T","Hercules <100T","Jcb >500T","John <100T","Kawasaki >500T","Komatsu 100T - 200T","Kubota 100T - 200T","Multione >500T","New <100T","Takeuchi 100T - 200T","Terex >500T","Toyota 200 - 500T","Victory 100T - 200T","Volvo 100T - 200T","Wacker 100T - 200T","WCM >500T"]
}


bu_names = {
    :Roads => ["Road Maintenance","Asset Development","Short Term Contracting","CO-Builds","Long Term Contracting"],
    :Infrastructure => ["Civil Works", "Infrastructure", "Underground Works"]
}


#                               BU Seeds
# bu_names.each do |key, model|
#         model.each do |v|
#             b = BusinessUnit.new
#             b.bu_name = v
#             b.division_name = key
#             b.save
#         end
# end

                        #   Maintenance Seeds 
500.times do
    m = MaintenanceLog.new
    m.asset_id = rand(1...625)
    m.maintenance_type_id = rand(1...6)
    m.expense_value = rand(100...10000)
    m.user_id = rand(1...3)
    m.date_time = "20#{ rand(10...20) }-#{ rand(01...10) }-#{ rand(01...10) }"
    m.save
end
                        #    Revenue Seeds 
600.times do
    u = UtilisationLog.new
    u.asset_id = rand(1...625)
    u.revenue_type_id = rand(1...7)
    u.revenue_value = rand(-1000...10000)
    u.user_id = rand(1...3)
    u.date_time = "20#{ rand(10...20) }-#{ rand(01...10) }-#{ rand(01...10) }"
    u.save
end

# Asset.each do |item|
#     puts item
#     # item.update purchase_date='2019-02-02'
#     # item.save
# end

# a = Asset.all


# counter = 1
# 497.times do 
#     a.update_all 
#     Asset.where(id: counter).update_all purchase_date: "20#{ rand(10...20) }-#{ rand(01...10) }-#{ rand(01...10) }"
#     counter += 1
# end





# INSERT INTO revenue_types (revenue_name) VALUES ('Operations')
# INSERT INTO revenue_types (revenue_name) VALUES ('Maintenance Works')
# INSERT INTO revenue_types (revenue_name) VALUES ('Project Works')

# INSERT INTO maintenance_types (maintenance_name) VALUES ('Repairs')
# INSERT INTO maintenance_types (maintenance_name) VALUES ('Routine Maintenance')



# 125.times do 
#     asset_type.each do |key, model|
#         bu = [1,2,3,4,5,6,7]
#         a = Asset.new
#         a.description = "#{model.sample}"
#         a.category = "#{key}" 
#         a.bu_id = bu.sample
#         a.purchase_date = "20#{ rand(10...20) }-#{ rand(01...10) }-#{ rand(01...10) }"
#         a.purchase_cost = rand(50000...150000)
#         a.registration_expiry = "20#{ rand(18...22) }-#{ rand(01...10) }-#{ rand(01...10) }"
#         a.save
#     end
# end





# 100.times do
#     asset_type.each do |key, model|
#         a = Asset.new
#         a.description = "#{ asset_type.sample}" 
#         a.category = "#{ asset_type.sample}"
#         a.save
#     end
# end

