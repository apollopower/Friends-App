require 'test_helper'

class PostTest < ActiveSupport::TestCase

  def setup
    @user = users(:snorlax)

    @post = @user.posts.build(content: "Hello my friends!")
  end

  test "Post should be valid" do
    assert @post.valid?
  end

  test "User ID should be present" do
    @post.user_id = nil
    
    assert_not @post.valid?
  end
end
