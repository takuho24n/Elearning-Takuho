class Choice < ApplicationRecord
    belongs_to :word

    default_scope -> { order('created_at DESC') }
    validates :content, presence: true, length: { maximum: 140 }
end
