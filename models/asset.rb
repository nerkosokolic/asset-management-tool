class Asset < ActiveRecord::Base
    has_many :maintenance_logs
    has_many :utilisation_logs
end