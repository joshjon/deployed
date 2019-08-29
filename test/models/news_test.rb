require 'test_helper'

class NewsTest < ActiveSupport::TestCase
  def setup
    @user = users(:gerald)
    @news = News.new(by: @user.username, title: 'Lorem ipsum', url: 'https://bitbucket.org')
  end

  test 'news item should be valid' do
    assert @news.valid?
  end

  test 'username should be present' do
    @news.by = nil
    assert_not @news.valid?, 'Saved without username'
  end

  test 'url should be valid' do
    @news.url = 'testingurlvalid'
    assert_not @news.valid?
  end

  test 'title should be present' do
    @news.title = '   '
    assert_not @news.valid?
  end

  test 'title should be at least 10' do
    @news.title = 'a' * 9
    assert_not @news.valid?
  end

  test 'title should be at most 200 characters' do
    @news.title = 'a' * 9
    assert_not @news.valid?
  end

  test 'order should be most recent first' do
    assert_equal items(:most_recent), News.first
  end
end
