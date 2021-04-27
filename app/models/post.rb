class Post < ActiveRecord::Base
  has_many :post_categories
  #gives us methods example Post_categories, post_categories << , post_categories.delete 
  # #post_category_ids=ids

  has_many :categories, through: :post_categories
  #has_many_through gives us more methods example, 
  has_many :comments
  has_many :users, through: :comments

  def categories_attributes=(category_attributes)
    category_attributes.values.each do |category_attribute|
      if category_attribute["name"].present?
        category = Category.find_or_create_by(category_attribute)
        self.categories << category
      end
    end
  end

end
