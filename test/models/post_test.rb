require 'test_helper'

class PostTest < ActiveSupport::TestCase

  def setup
    @user = users(:snorlax)
    @channel = @user.channels.create(title: "Fake Channel")

    @post = @user.posts.create(content: "My Post!", channel_id: @channel.id, created_at: "#{2.minutes.ago}")

  end

  test "Post should be valid" do
    assert @post.valid?
  end

  test "User ID should be present" do
    @post.user_id = nil
    
    assert_not @post.valid?
  end

  test "Channel ID should be present" do
    @post.channel_id = nil

    assert_not @post.valid?
  end

  test "Post should not be empty" do
    @post.content = "     "

    assert_not @post.valid?
  end

  test "Post should be longer than 1 character" do
    @post.content = "H"

    assert_not @post.valid?
  end

  test "Post should be no longer than 1120 characters" do
    @post.content = "a" * 1121

    assert_not @post.valid?
  end

  test "Post order should be more recent first" do
    assert_equal posts(:most_recent), Post.first
  end

  test "Associated comments should be destroyed" do
    @user.comments.create!(content: "wawawa", post_id: @post.id, channel_id: @channel.id)

    assert_difference 'Comment.count', -1 do
      @post.destroy
    end
  end

end
