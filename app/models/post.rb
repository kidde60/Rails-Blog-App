class Post < ApplicationRecord
    belongs_to :author, class_name: 'User'
    has_many :comments, foreign_key:'post_id'
    has_many :likes, foreign_key:'post_id'

    def most_recent_comments
       comments.order(created_at: :desc).limit(5)
    end
end
