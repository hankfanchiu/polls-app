class Response < ActiveRecord::Base
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
end
