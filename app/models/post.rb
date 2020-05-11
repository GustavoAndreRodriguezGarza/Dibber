class Post < ApplicationRecord
    has_many :comentarios, dependent: :destroy
    belongs_to :user
    validates :user_id, presence: true
end
