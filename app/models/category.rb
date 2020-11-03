class Category < ApplicationRecord
    has_many :words, dependent: :destroy
    
    default_scope -> { order('created_at DESC')}
    validates :title, presence: true, length: { minimum: 3 }
    validates :description, presence: true, length: { minimum: 3, maximum: 140 }

    def feed
        Word.where("category_id = ?", id)
    end
end
