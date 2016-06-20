class Form::Shop < Shop
  REGISTRABLE_ATTRIBUTES = %i(name address latitude longitude)

  has_many :shop_categories, class_name: 'Form::ShopCategory'
end