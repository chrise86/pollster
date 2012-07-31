require 'test_helper'

class AnswersControllerTest < ActionController::TestCase
  test "should get new" do
    get :new
    assert_response :success
  end

  test "should get _form" do
    get :_form
    assert_response :success
  end

  test "should get _answers" do
    get :_answers
    assert_response :success
  end

  test "should get _answer" do
    get :_answer
    assert_response :success
  end

end
