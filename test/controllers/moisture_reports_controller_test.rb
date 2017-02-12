require 'test_helper'

class MoistureReportsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @moisture_report = moisture_reports(:one)
  end

  test "should get index" do
    get moisture_reports_url
    assert_response :success
  end

  test "should get new" do
    get new_moisture_report_url
    assert_response :success
  end

  test "should create moisture_report" do
    assert_difference('MoistureReport.count') do
      post moisture_reports_url, params: { moisture_report: { value: @moisture_report.value } }
    end

    assert_redirected_to moisture_report_url(MoistureReport.last)
  end

  test "should show moisture_report" do
    get moisture_report_url(@moisture_report)
    assert_response :success
  end

  test "should get edit" do
    get edit_moisture_report_url(@moisture_report)
    assert_response :success
  end

  test "should update moisture_report" do
    patch moisture_report_url(@moisture_report), params: { moisture_report: { value: @moisture_report.value } }
    assert_redirected_to moisture_report_url(@moisture_report)
  end

  test "should destroy moisture_report" do
    assert_difference('MoistureReport.count', -1) do
      delete moisture_report_url(@moisture_report)
    end

    assert_redirected_to moisture_reports_url
  end
end
