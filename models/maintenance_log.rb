
class MaintenanceLog < ActiveRecord::Base
 belongs_to :maintenance_type
 belongs_to :asset
end