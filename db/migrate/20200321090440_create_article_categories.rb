class CreateArticleCategories < ActiveRecord::Migration[5.2]
  def change
    create_table :article_categories do |t|
    	t.integer :id_article
    	t.integer :id_category
    end
  end
end
