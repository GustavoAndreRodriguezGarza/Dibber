class Post < ApplicationRecord
    has_many :comentarios, dependent: :destroy
end
