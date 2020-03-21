
require 'test_helper'

class CreateArticleWithCategoryTest < ActionDispatch::IntegrationTest


	def setup
		@user = User.create(username: "john", email: "john@inter.pl", password: "password")
		sign_in_as(@user,"password")
		@category = Category.create(name: "sports")

	end



	test "Create article with category" do
		get new_article_path
		assert_template 'articles/new'
		assert_difference 'ArticleCategory.count',1 do
			post articles_path, params:{article: {title:'sports',description:"description",category_ids:[1]}}
			follow_redirect!
		end
		assert_template "articles/show"
		get category_path(@category)
		assert_match "sports", response.body
		assert_select 'small'
	end

end	