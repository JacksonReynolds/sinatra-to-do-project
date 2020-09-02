class User < ActiveRecord::Base
    has_many :lists
    has_many :to_dos, through: :lists
    has_secure_password
    validates :username, presence: true
    # validates :password, presence: true
    validates_uniqueness_of :username
end
