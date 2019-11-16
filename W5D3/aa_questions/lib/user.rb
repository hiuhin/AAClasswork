require_relative "questions_database"
require_relative "question"
require_relative "reply"

class User
  attr_accessor :id, :fname, :lname

  def self.all
    data = QuestionsDatabase.instance.execute("SELECT * FROM users;")
    data.map { |datum| User.new(datum) }
  end

  def self.find_by_id(id)
    users = QuestionsDatabase.instance.execute(<<-SQL, id)
      SELECT
        *
      FROM
        users
      WHERE
        id = ?
    SQL
    return nil unless users.length > 0

    User.new(users.first) # question is stored in an array!
  end

  def self.find_by_name(fname, lname)
    users = QuestionsDatabase.instance.execute(<<-SQL, fname, lname)
      SELECT
        *
      FROM
        users
      WHERE
        fname = ? AND lname = ?
    SQL
    return nil unless users.length > 0
    User.new(users.first) 
  end

  def initialize(options)
    @id = options['id']
    @fname = options['fname']
    @lname = options['lname']
  end

  def authored_questions
    Question.find_by_author_id(id)
  end

  def atuhored_replies
    Reply.find_by_user_id(id)
  end

#   def create
#     raise "#{self} already in database" if @id
#     QuestionsDatabase.instance.execute(<<-SQL, @title, @year, @questionwright_id)
#       INSERT INTO
#         questions (title, year, questionwright_id)
#       VALUES
#         (?, ?, ?)
#     SQL
#     @id = QuestionsDatabase.instance.last_insert_row_id
#   end

#   def update
#     raise "#{self} not in database" unless @id
#     QuestionsDatabase.instance.execute(<<-SQL, @title, @year, @questionwright_id, @id)
#       UPDATE
#         questions
#       SET
#         title = ?, year = ?, questionwright_id = ?
#       WHERE
#         id = ?
#     SQL
#   end
# end

# class questionwright
#   attr_accessor :name, :birth_year
#   attr_reader :id

#   def self.all
#     data = QuestionsDatabase.instance.execute("SELECT * FROM questionwrights")
#     data.map { |datum| questionwright.new(datum) }
#   end

#   def self.find_by_name(name)
#     person = QuestionsDatabase.instance.execute(<<-SQL, name)
#       SELECT
#         *
#       FROM
#         questionwrights
#       WHERE
#         name = ?
#     SQL
#     return nil unless person.length > 0 # person is stored in an array!

#     questionwright.new(person.first)
#   end

#   def initialize(options)
#     @id = options['id']
#     @name = options['name']
#     @birth_year = options['birth_year']
#   end

#   def create
#     raise "#{self} already in database" if @id
#     QuestionsDatabase.instance.execute(<<-SQL, @name, @birth_year)
#       INSERT INTO
#         questionwrights (name, birth_year)
#       VALUES
#         (?, ?)
#     SQL
#     @id = QuestionsDatabase.instance.last_insert_row_id
#   end

#   def update
#     raise "#{self} not in database" unless @id
#     QuestionsDatabase.instance.execute(<<-SQL, @name, @birth_year, @id)
#       UPDATE
#         questionwrights
#       SET
#         name = ?, birth_year = ?
#       WHERE
#         id = ?
#     SQL
#   end

#   def get_questions
#     raise "#{self} not in database" unless @id
#     questions = QuestionsDatabase.instance.execute(<<-SQL, @id)
#       SELECT
#         *
#       FROM
#         questions
#       WHERE
#         questionwright_id = ?
#     SQL
#     questions.map { |question| question.new(question) }
#   end

end