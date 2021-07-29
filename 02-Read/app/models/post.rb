# You can use a global variable, DB, which
# is an instance of SQLite3::Database
# NO NEED TO CREATE IT, JUST USE IT.


class Post
  attr_reader :id
  attr_accessor :title, :url
  # TODO
  def initialize(opts = {})
    @id = opts['id']
    @title = opts['title']
    @url = opts['url']
    @votes = opts['votes']

    DB.results_as_hash = true
  end

  def self.find(id)
    data = DB.execute("SELECT * FROM posts WHERE id = ?", id)[0]
    return nil if data.nil?

    Post.new(data)
  end

  def self.all
    data = DB.execute("SELECT * FROM posts")
    data.map { |post| Post.new(post) }
  end
end