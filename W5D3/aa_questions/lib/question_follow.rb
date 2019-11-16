require_relative "questions_database"
require_relative "user"
require_relative "question"

class QuestionFollow
  attr_accessor :user_id, :question_id

  def self.all
    data = QuestionsDatabase.instance.execute("SELECT * FROM question_follows;")
    data.map { |datum| Reply.new(datum) }
  end

  # def self.followers_for_question_id(question_id)
  #   followers = QuestionsDatabase.instance.execute(<<-SQL, question_id)
  #     SELECT
  #       *
  #     FROM
  #       users
  #     JOIN
  #       questions_follow 
  #     WHERE
  #       question_id = ?
  #   SQL
  #   return nil unless replies.length > 0
  #   replies.map { |datum| Reply.new(datum) }
  # end

  def initialize(options)
    @question_id = options['question_id']
    @user_id = options['user_id']
  end


end