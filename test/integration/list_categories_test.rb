require "test_helper"

class ListCategoriesTest < ActionDispatch::IntegrationTest

  def setup
    @category = Category.create(name: "sports")
    @category2 = Category.create(name: "programming")
  end

  test "should show categories listing" do
    get categories_path
    assert_template "categories/index"
    assert_select "a[href=?]", category_path(@category)
    assert_select "a[href=?]", category_path(@category2)
    assert_select ".category-data__name", text: @category.name
    assert_select ".category-data__name", text: @category2.name
  end

end