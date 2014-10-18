Spree::User.class_eval do
  def has_purchased?(product)
    count_products = Spree::Order.includes(line_items: [:variant])
                .where(spree_variants: { product_id: product.id },
                       spree_orders: {user_id: self.id}).size()
    count_products > 0
  end
end
