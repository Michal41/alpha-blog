class ArticlesController < ApplicationController

	def index
		@articles = Article.all
		puts "+++++++++++++++++++++++++++++"
		puts @articles
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
			render 'edit'
		end
	end

	def show
		@article = Article.find(params[:id])
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