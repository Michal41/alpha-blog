class ArticlesController < ApplicationController

	def index
		@articles = Article.all

	end

	def new
		@article = Article.new	
	end

	def create
		#render plain: params[:article]
		@article = Article.new(article_params)
		@article.save
		if @article.save
			flash[:notice]='Article was succesly created'
			redirect_to article_path(@article)
		else
			render 'new'
		end
	end

	def show
		@article = Article.find(params[:id])
	end

	def destroy
		@article= Article.find(params[:id])
		@article.destroy
		flash[:notice]= "Article was Succesfully deleted"
		redirect_to articles_path
	end

	def edit
		@article = Article.find(params[:id])

	end

	def update
		@article = Article.find(params[:id])
		if @article.update(title:params[:article][:title],
				description:params[:article][:description])
			flash[:notice] = "Upadated Succesfully"
			redirect_to article_path(@article)
		else
			render "new"
		end
	end




	private
		def article_params
			params.require(:article).permit(:title, :description)

		end

end