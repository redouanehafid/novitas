class Order < ApplicationRecord
  belongs_to :formation, :counter_cache => true
  belongs_to :user
end
