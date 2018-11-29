require 'test_helper'

class CommentsControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers
  setup do
    @comment = comments(:one)
    sign_in users(:one)
  end

  test "should show comment" do
    get comment_url(@comment)
    assert_response :success
  end

  test "should get edit" do
    get edit_comment_url(@comment)
    assert_response :success
  end

  test "should update comment" do
    patch comment_url(@comment), params: { comment: { content: @comment.content, review_id: @comment.review_id, title: @comment.title, user_id: @comment.user_id } }
    assert_redirected_to review_url(@comment.review)
  end

end
