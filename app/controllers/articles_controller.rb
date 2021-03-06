class ArticlesController < ApplicationController
	before_action :set_article , only:[:edit, :update, :show, :destroy]
	before_action :require_user, except: [:index, :show]
	before_action :require_same_user, only: [:edit, :update, :destroy]

	def index
		#@articles = Article.paginate(page: params[:page], per_page: 2)
		@articles =Article.paginate page: params[:page], per_page: 5
		puts current_user
	end

	def new
		@article = Article.new
	end

	def create
		#render plain: params[:article]
		@article = Article.new(article_params)
		@article.user=current_user
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
		if @article.update(article_params)
			flash[:notice] = "Upadated Succesfully"
			redirect_to article_path(@article)
		else
			render "new"
		end
	end




	private
		def article_params
			params.require(:article).permit(:title, :description,category_ids:[])

		end
		def set_article
			@article = Article.find(params[:id])
		end

		def require_same_user

			if current_user != @article.user && !current_user.admin?
				flash[:danger]= "you can only delete or edit your articels"
				redirect_to root_path			
			end

		end

end
