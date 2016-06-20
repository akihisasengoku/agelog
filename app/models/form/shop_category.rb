class Form::ShopCategory < ShopCategory
    REGISTRABLE_ATTRIBUTES = %i(id shop_id category_id _destroy)

    def selectable_categories
        Category.all
    end
end
