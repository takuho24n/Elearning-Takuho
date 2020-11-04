class Word < ApplicationRecord
    belongs_to :category

    #Choices for 2 lines
    has_many :choices, dependent: :destroy
    accepts_nested_attributes_for :choices

    default_scope -> { order('created_at DESC') }
    validates :words, presence: true
    validates  :category_id, presence: true

end
