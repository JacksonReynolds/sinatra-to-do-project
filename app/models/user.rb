class User < ActiveRecord::Base
    has_many :lists
    has_many :to_dos, through: :lists
    has_secure_password
    validates :name, presence: true
    validate_uniqueness_of :username
end
