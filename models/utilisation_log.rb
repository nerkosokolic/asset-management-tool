
class UtilisationLog < ActiveRecord::Base
    belongs_to :revenue_type
    belongs_to :asset
end