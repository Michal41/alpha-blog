

require 'test_helper'

class ArticleCategoryTest < ActiveSupport::TestCase
	def setup
		@user = User.create(username: "john", email: "john@inter.pl", password: "password", admin: true)
		@category = Category.create(name: "sports")
		@article = Article.create(title: "title", description:"description", user: @user)
	end
	

	test "Add articlecategory from article" do
		@article.categories.append(@category)
		assert @article.valid?
	end

	test "Add articlecategory from category " do 
		@category.articles.append(@article)
		assert @category.valid?
	end


end