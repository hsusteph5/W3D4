# == Schema Information
#
# Table name: responses
#
#  id               :bigint(8)        not null, primary key
#  user_id          :integer
#  answer_choice_id :integer
#

class Response < ApplicationRecord
  
  validates :user_id, presence: true
  validates :answer_choice_id, presence: true
  validate :respondent_already_answered?
  
  belongs_to :answer_choice,
    primary_key: :id,
    foreign_key: :answer_choice_id,
    class_name: :AnswerChoice
    
  belongs_to :respondent,
    primary_key: :id,
    foreign_key: :user_id,
    class_name: :User
  
  has_one :question,
    through: :answer_choice,
    source: :question
  
  #given a response, you want to see all the responses to the same question
  def sibling_responses
    question.responses.where.not('responses.id = ?', self.id)
  end
    
  def respondent_already_answered?
    sibling_responses.where('responses.user_id = ?', self.user_id).length > 0
  end
end
