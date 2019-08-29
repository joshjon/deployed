require 'test_helper'

class SiteLayoutTest < ActionDispatch::IntegrationTest
  test "layout links" do
      get root_path
      # count two links - logo and navigationelement
      assert_select "a[href=?]", root_path, count: 2
      assert_select "a[href=?]", newcomments_path
      assert_select "a[href=?]", submit_path
      assert_select "a[href=?]", login_path
    end
end
