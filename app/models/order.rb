class Order < ApplicationRecord
  belongs_to :formation
  belongs_to :user
end
