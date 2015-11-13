# Poll App

A polling Rails project for learning ActiveRecord, query methods, models, and migrations.

## Schema

- An author (user) owns a poll.
- A poll contains a question.
- Each question has many answer choices.
- Other users submit responses to the question by selecting one of the available answer choices.

## Validations

- A user cannot create multiple responses to the same question.
- An author of a question cannot create a response to his/her own question.

## Seeding

Sample data available in the [seed](/db/seeds.rb) file.
