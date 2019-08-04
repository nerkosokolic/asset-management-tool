
class RevenueType < ActiveRecord::Base
    has_many :utilisation_logs
end