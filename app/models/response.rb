class Response < ActiveRecord::Base
  validates :answer_choice_id, :respondent_id, presence: true
  
  validate :respondent_has_not_already_answered_question
  validate :author_cannot_respond

  belongs_to(
    :answer_choice,
    class_name: "AnswerChoice",
    primary_key: :id,
    foreign_key: :answer_choice_id
  )

  belongs_to(
    :respondent,
    class_name: "User",
    primary_key: :id,
    foreign_key: :respondent_id
  )

  has_one(
    :question,
    through: :answer_choice,
    source: :question
  )

  def sibling_responses
    responses = self.question.responses
    responses.where(':id IS NULL OR responses.id != :id', id: self.id)
  end

  private
  def respondent_has_not_already_answered_question
    if sibling_responses.exists?(respondent_id: self.respondent_id)
      errors[:respondent] << "has already answered question"
    end
  end

  def author_cannot_respond
    author_id = self.question.poll.author.id
    if author_id == self.respondent_id
      errors[:author] << "cannot respond to own question"
    end
  end
end
