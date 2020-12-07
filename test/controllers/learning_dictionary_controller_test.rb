require 'test_helper'

class LearningDictionaryControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get learning_dictionary_index_url
    assert_response :success
  end

end
