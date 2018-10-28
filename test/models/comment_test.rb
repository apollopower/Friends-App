require 'test_helper'

class CommentTest < ActiveSupport::TestCase

  def setup
    @user = users(:snorlax)

    @channel = @user.channels.create(title: "Jonas Channel")

    @post = @user.posts.build(content: "Good to see you!")
    @channel.posts.push(@post)

    @comment = @user.comments.build(content: "How is it going?", post_id: @post.id, channel_id: @channel.id)

  end

  test "Comment should be valid" do
    assert @comment.valid?
  end

  test "Comment should belong to a user" do
    @comment.user_id = nil

    assert_not @comment.valid?
  end

  test "Comment should belong to a post" do
    @comment.post_id = nil

    assert_not @comment.valid?
  end

  test "Comment should belong to a channel" do
    @comment.channel_id = nil

    assert_not @comment.valid?
  end

  test "Comment should not be empty" do
    @comment.content = "      "

    assert_not @comment.valid?
  end

  test "Comment should not be longer than 280 characters" do
    @comment.content = "a" * 281

    assert_not @comment.valid?
  end

  test "Comment Order should be most recent first" do
    assert_equal comments(:most_recent), Comment.first
  end
end
