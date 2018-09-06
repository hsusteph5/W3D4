# == Schema Information
#
# Table name: questions
#
#  id      :bigint(8)        not null, primary key
#  poll_id :integer          not null
#  text    :text             not null
#

class Question < ApplicationRecord
  
  validates :poll_id, presence: true
  validates :text, presence: true
  
  has_many :answer_choices,
    primary_key: :id,
    foreign_key: :question_id,
    class_name: :AnswerChoice

  belongs_to :poll,
    primary_key: :id,
    foreign_key: :poll_id,
    class_name: :Poll
end
