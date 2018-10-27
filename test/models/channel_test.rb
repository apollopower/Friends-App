require 'test_helper'

class ChannelTest < ActiveSupport::TestCase
  
  def setup
    @channel = Channel.new(title: "High School Pals")
  end

  test "Channel should be valid" do
    assert @channel.valid?
  end

  test "Title Should not be blank" do
    @channel.title = "     "
    assert_not @channel.valid?
  end

  test "Title should not be too long" do
    @channel.title = "a" * 51
    assert_not @channel.valid?
  end
end
