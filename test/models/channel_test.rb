require 'test_helper'

class ChannelTest < ActiveSupport::TestCase
  
  def setup
    @user = User.create(first_name: "Jonas", last_name: "Erthal", 
      email: "jonas@erthal.co", password: "snorlax", password_confirmation: "snorlax")

    @other_user = users(:snorlax)

    @channel = @user.channels.create(title: "High School Pals")

  end

  test "Channel should be valid" do
    assert @channel.valid?
  end

  test "Title should not be blank" do
    @channel.title = "     "
    assert_not @channel.valid?
  end

  test "Title should not be too long" do
    @channel.title = "a" * 51
    assert_not @channel.valid?
  end

  test "Channel should belong to the user" do
    assert @user.channels.first['title'] == @channel.title
  end

  test "Channel should have original user" do
    assert @channel.users.include?(@user)
  end

  test "Channel should be able to include other users" do
    @channel.users.push(@other_user)

    assert @channel.users.include?(@other_user)
  end

  test "Channel should have slug" do
    assert_not @channel.slug.empty?
  end

  test "Duplicate slugs should not exist" do
    other_channel = Channel.create(title: "Other Channel")

    assert @channel.slug != other_channel.slug
  end
end
