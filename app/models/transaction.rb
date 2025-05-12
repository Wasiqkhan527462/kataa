class Transaction < ApplicationRecord
    belongs_to :customer
    has_one_attached :featured_image
end
