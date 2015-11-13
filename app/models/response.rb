class Response < ActiveRecord::Base
  validates :answer_choice_id, :respondent_id, presence: true

  validate :respondent_has_not_already_answered_question
  validate :question_author_cannot_respond

  belongs_to :answer_choice,
    class_name: "AnswerChoice",
    primary_key: :id,
    foreign_key: :answer_choice_id

  belongs_to :respondent,
    class_name: "User",
    primary_key: :id,
    foreign_key: :respondent_id

  has_one :question,
    through: :answer_choice,
    source: :question

  def sibling_responses
    responses = self.question.responses
    responses.where(':id IS NULL OR responses.id != :id', id: self.id)
  end

  def sibling_responses_improved
    binds = { answer_choice_id: self.answer_choice_id, id: self.id }
    self.class.find_by_sql([<<-SQL, binds])
      SELECT  responses.*
      FROM    answer_choices
      JOIN    questions ON questions.id = answer_choices.question_id
      JOIN    answer_choices AS ac2 ON ac2.question_id = questions.id
      JOIN    responses ON responses.answer_choice_id = ac2.id
      WHERE   answer_choices.id = :answer_choice_id
      AND     (:id IS NULL OR responses.id != :id)
    SQL
  end

  private
  def respondent_has_not_already_answered_question
    if sibling_responses.exists?(respondent_id: self.respondent_id)
      errors[:respondent] << "has already answered question"
    end
  end

  def question_author_cannot_respond
    author_id = Poll
      .joins(quesitons: { answer_choices: :responses })
      .where('answer_choices.id = ?', self.answer_choice_id)
      .pluck('polls.author_id')
      .first

    if author_id == self.respondent_id
      errors[:author] << "cannot respond to own question"
    end
  end
end
