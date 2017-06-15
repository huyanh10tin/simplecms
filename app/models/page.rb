class Page < ApplicationRecord
	has_and_belongs_to_many :admin_users
	has_many :sections
	belongs_to :subject, { :optional => false}
	scope :sorted, lambda {order("position ASC")}
end
