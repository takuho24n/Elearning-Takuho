class Word < ApplicationRecord
    belongs_to :category

    default_scope -> { order('created_at DESC') }
    validates :words, presence: true
    validates  :category_id, presence: true

end
