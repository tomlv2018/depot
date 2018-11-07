class Product < ApplicationRecord
#	default_scope {order (:title)}
    Product.order(title: :desc)
	validates :title, :description, :image_url, :presence => true
	validates :price, :numericality =>{:greater_than_or_equal_to =>0.01}
	validates :title, :uniqueness => true
	validates :image_url, :format => {:with => %r{\.(gif|jpg|png)\z}i,
	          :message => 'must be a URL for GIF,JPG,or PNG image.'
	      }
	#relation line_items
	has_many:line_items
	before_destroy:ensure_not_referenced_by_any_line_item
	private
	def ensure_not_referenced_by_any_line_item
		if line_items.empty?
			returen true
		else
			errors.add(:base,'Line Items present')
			returen false
		end
		
	end
end
