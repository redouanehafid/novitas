class Formation < ApplicationRecord
  belongs_to :category, :counter_cache => true
end
