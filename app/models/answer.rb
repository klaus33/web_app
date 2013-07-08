class Answer < ActiveRecord::Base
  attr_accessible :content, :correct, :question_id, :user_id, :vote, :answer_id
  belongs_to :question
  belongs_to :user
  has_many :comment, dependent: :destroy
  validates :user_id, presence: true
  acts_as_votable
  
end
