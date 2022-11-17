require "test_helper"

class DocumentsControllerTest < ActionDispatch::IntegrationTest
  # test "the truth" do
  #   assert true
  # end
  test "should show document" do
    get document_path(Document.first), headers: { "HTTP_REFERER" => "http://example.com/home" }
  end
end
