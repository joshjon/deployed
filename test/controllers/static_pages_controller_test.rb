require 'test_helper'

class StaticPagesControllerTest < ActionDispatch::IntegrationTest
  def setup
    @home = 'Deployed'
    # first page
    @page = 0
  end

  test 'should get root' do
    get '/'
    assert_response :success
  end

  test 'should get home' do
    get root_path
    assert_response :success
    assert_select 'title', "#{@home} | #{@page}"
  end

  test 'should get about' do
    get about_path
    assert_response :success
    assert_select 'title', 'About'
  end
end
