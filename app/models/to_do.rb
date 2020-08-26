class ToDo < ActiveRecord::Base
    belongs_to :list
    has_one :user, through: :list
    # belongs_to :user, through: :list # doesn't like through:
end
