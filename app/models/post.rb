class Post < ApplicationRecord
    validates :content, {presence: true, length: {maximum: 1000}}
    validates :user_id, {presence: true}
    has_many :comments
    belongs_to :user
end