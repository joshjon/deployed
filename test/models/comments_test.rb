require 'test_helper'

class CommentsTest < ActiveSupport::TestCase
  def setup
    @user = users(:gerald)
    @comment = Comment.new(type: 'Comment', by: @user.username,
                           text: 'test comment')
  end

  test 'comment item should be valid' do
    assert @comment.valid?
  end

  test 'username should be present' do
    @comment.by = nil
    assert_not @comment.valid?, 'Saved without username'
  end

  test 'text should be present' do
    @comment.text = '   '
    assert_not @comment.valid?
  end

  test 'text should be at least 3' do
    @comment.text = 'a' * 2
    assert_not @comment.valid?
  end

  test 'text should be at most 1000 characters' do
    @comment.text = 'a' * 1001
    assert_not @comment.valid?
  end

  test 'order should be most recent first' do
    assert_equal items(:most_recent_comment), Comment.first
  end
end
