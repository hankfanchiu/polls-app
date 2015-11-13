class User < ActiveRecord::Base
  validates :user_name, presence: true, uniqueness: true

  has_many :authored_polls,
    class_name: "Poll",
    primary_key: :id,
    foreign_key: :author_id

  has_many :responses,
    class_name: "Response",
    primary_key: :id,
    foreign_key: :respondent_id

  def sql_completed_polls
    Poll.find_by_sql([<<-SQL, id: self.id])
      SELECT
        polls.*
      FROM
        polls
      JOIN
        questions ON questions.poll_id = polls.id
      JOIN
        answer_choices ON answer_choices.question_id = questions.id
      LEFT OUTER JOIN (
        SELECT
          *
        FROM
          responses
        WHERE
          responses.respondent_id = :id
        ) AS responses ON responses.answer_choice_id = answer_choices.id
      GROUP BY
        polls.id
      HAVING
        COUNT(DISTINCT questions.id) = COUNT(responses.id)
    SQL
  end

  def completed_polls
    joins_fragment = <<-SQL
      LEFT OUTER JOIN (
        SELECT *
        FROM responses
        WHERE respondent_id = #{self.id}
        ) AS responses ON responses.answer_choice_id = answer_choices.id
    SQL

    Poll
      .joins('JOIN questions ON questions.poll_id = polls.id')
      .joins('JOIN answer_choices ON answer_choices.question_id = questions.id')
      .joins(joins_fragment)
      .group('polls.id')
      .having('COUNT(DISTINCT questions.id) = COUNT(responses.id)')
  end
end
