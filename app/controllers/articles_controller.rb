class ArticlesController < ApplicationController
	before_action :set_article , only:[:edit, :update, :show, :destroy]
	def index
		#@articles = Article.paginate(page: params[:page], per_page: 2)
		@articles =Article.paginate page: params[:page], per_page: 5
	end

	def new
		@article = Article.new	
	end

	def create
		#render plain: params[:article]
		@article = Article.new(article_params)
		@article.user=User.last
		@article.save
		if @article.save
			flash[:success]='Article was succesly created'
			redirect_to article_path(@article)
		else
			render 'new'
		end
	end

	def show
	end

	def destroy
		@article= Article.find(params[:id])
		@article.destroy
		flash[:danger]= "Article was Succesfully deleted"
		redirect_to articles_path
	end

	def edit

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
		def set_article
			@article = Article.find(params[:id])
		end

end