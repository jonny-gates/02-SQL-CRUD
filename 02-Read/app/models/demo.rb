

class Post
  def initialize(attr = {})
    @id = attr[:id]
  end

  def print_id
    puts @id
  end

  def destroy
    puts "destroying #{@id}"
  end
end

post = Post.new(id: 1)

post.destroy