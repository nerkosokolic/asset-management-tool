
class MaintenanceType < ActiveRecord::Base
    has_many :maintenance_logs
end