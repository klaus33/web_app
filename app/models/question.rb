class Question < ActiveRecord::Base
    attr_accessible  :content, :tags
    belongs_to :user 
    validates :user_id, presence: true
    validates :content, presence: true, length: { maximum: 500 }
end
