class Question < ActiveRecord::Base
  validates :text, :poll_id, presence: true

  has_many :answer_choices,
    class_name: "AnswerChoice",
    primary_key: :id,
    foreign_key: :question_id

  belongs_to :poll,
    class_name: "Poll",
    primary_key: :id,
    foreign_key: :poll_id

  has_many :responses,
    through: :answer_choices,
    source: :responses

  def slow_results
    results = {}
    self.answer_choices.each do |answer|
      results[answer.text] = answer.responses.count
    end
    results
  end

  def better_results
    results = {}
    answers = self.answer_choices.includes(:responses)
    answers.each do |answer|
      results[answer.text] = answer.responses.length
    end
    results
  end

  def sql_results
    answers = self.class.find_by_sql([<<-SQL, id])
      SELECT
        answer_choices.*,
        COUNT(*) AS counts
      FROM
        answer_choices
      JOIN
        responses ON responses.answer_choice_id = answer_choices.id
      WHERE
        answer_choices.question_id = ?
      GROUP BY
        answer_choices.id
    SQL

    results = {}
    answers.each do |answer|
      results[answer.text] = answer.counts
    end
    results
  end

  def results
    results = {}

    grouped_responses = self
      .answer_choices
      .select("answer_choices.text, COUNT(*) AS count")
      .joins(:responses)
      .where("answer_choices.question_id = ?", self.id)
      .group("answer_choices.id")

    grouped_responses.each do |answer_choice|
      results[answer_choice.text] = answer_choice.count
    end

    results
  end
end
