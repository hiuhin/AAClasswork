require_relative "questions_database"
require_relative "user"

class Question
  attr_accessor :id, :title, :body, :author_id

  def self.all
    questions = QuestionsDatabase.instance.execute("SELECT * FROM questions;")
    questions.map { |q| Question.new(q) }
  end

  def self.find_by_id(id)
    questions = QuestionsDatabase.instance.execute(<<-SQL, id)
      SELECT
        *
      FROM
        questions
      WHERE
        id = ?
    SQL
    return nil unless questions.length > 0

    Question.new(questions.first) # question is stored in an array!
  end

  def self.find_by_author_id(author_id)
    questions = QuestionsDatabase.instance.execute(<<-SQL, author_id)
      SELECT
        *
      FROM
        questions
      WHERE
        author_id = ?
    SQL
    return nil unless questions.length > 0
    questions.map { |q| Question.new(q) }
  end

  def initialize(options)
    @id = options['id']
    @title = options['title']
    @body = options['body']
    @author_id = options['author_id']
  end

  def author
    User.find_by_id(author_id)
  end

  def replies
    Reply.find_by_question_id(id)
  end



end