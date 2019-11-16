require_relative "questions_database"
require_relative "user"
require_relative "question"

class Reply
  attr_accessor :id, :body, :parent_reply_id, :question_id, :user_id

  def self.all
    data = QuestionsDatabase.instance.execute("SELECT * FROM replies;")
    data.map { |datum| Reply.new(datum) }
  end

  def self.find_by_id(id)
    replies = QuestionsDatabase.instance.execute(<<-SQL, id)
      SELECT
        *
      FROM
        replies
      WHERE
        id = ?
    SQL
    return nil unless replies.length > 0

    Reply.new(replies.first)
  end

  def self.find_by_user_id(user_id)
    replies = QuestionsDatabase.instance.execute(<<-SQL, user_id)
      SELECT
        *
      FROM
        replies
      WHERE
        user_id = ?
    SQL
    return nil unless replies.length > 0
    replies.map { |datum| Reply.new(datum) }
  end

  def self.find_by_question_id(question_id)
    replies = QuestionsDatabase.instance.execute(<<-SQL, question_id)
      SELECT
        *
      FROM
        replies
      WHERE
        question_id = ?
    SQL
    return nil unless replies.length > 0
    replies.map { |datum| Reply.new(datum) }
  end

  def initialize(options)
    @id = options['id']
    @body = options['body']
    @parent_reply_id = options['parent_reply_id']
    @question_id = options['question_id']
    @user_id = options['user_id']
  end

  def author
    User.find_by_id(user_id)
  end

  def question
    Question.find_by_id(question_id)
  end

  def parent_reply
    Reply.find_by_id(parent_reply_id)
  end

  def child_replies
    replies = QuestionsDatabase.instance.execute(<<-SQL, id)
      SELECT
        *
      FROM
        replies
      WHERE
        parent_reply_id = ?
    SQL
    return nil unless replies.length > 0
    replies.map { |datum| Reply.new(datum) }
  end

end