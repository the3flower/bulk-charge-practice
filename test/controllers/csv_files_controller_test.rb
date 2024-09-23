require "test_helper"

class CsvFilesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get csv_files_index_url
    assert_response :success
  end

  test "should get upload" do
    get csv_files_upload_url
    assert_response :success
  end

  test "should get download" do
    get csv_files_download_url
    assert_response :success
  end
end
