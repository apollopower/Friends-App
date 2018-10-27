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

  test "Post should not be empty" do
    @post.content = "     "

    assert_not @post.valid?
  end

  test "Post should not be extremely short" do
    @post.content = "H"

    assert_not @post.valid?
  end

  test "Post should belong to at least one channel" do
    assert_not @post.channels.empty?
  end
end
