require 'test_helper'

class ExportCtrlControllerTest < ActionDispatch::IntegrationTest
  test "should get export_page" do
    get export_ctrl_export_page_url
    assert_response :success
  end

end
