# == Schema Information
#
# Table name: answer_choices
#
#  id          :bigint(8)        not null, primary key
#  question_id :integer          not null
#  text        :text             not null
#

class AnswerChoice < ApplicationRecord
  validates :question_id, presence: true
  validates :text, presence: true
  
  belongs_to :question,
    primary_key: :id,
    foreign_key: :question_id,
    class_name: :Question
    
  has_many :responses,
    primary_key: :id,
    foreign_key: :answer_choice_id,
    class_name: :Response
end
