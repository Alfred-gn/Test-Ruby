require "test_helper"

class DocumentTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  test "document not save article without url" do
    document = Document.new
    document.nbresa = 2
    document.nbbuyers = 2
    document.buyersage = 2
    document.resaprice = 2
    assert_not document.save, "Saved the document without a url"
  end

  test "document not save article without nbresa" do
    document = Document.new
    document.url = "test"
    document.nbbuyers = 2
    document.buyersage = 2
    document.resaprice = 2
    assert_not document.save, "Saved the document without a nbresa"
  end

  test "document not save article without nbbuyers" do
    document = Document.new
    document.url = "test"
    document.nbresa = 2
    document.buyersage = 2
    document.resaprice = 2
    assert_not document.save, "Saved the document without a nbbuyers"
  end

  test "document not save article without buyersage" do
    document = Document.new
    document.url = "test"
    document.nbresa = 2
    document.nbbuyers = 2
    document.resaprice = 2
    assert_not document.save, "Saved the document without a buyersage"
  end

  test "document not save article without resaprice" do
    document = Document.new
    document.url = "test"
    document.nbresa = 2
    document.nbbuyers = 2
    document.buyersage = 2
    assert_not document.save, "Saved the document without a resaprice"
  end

end
