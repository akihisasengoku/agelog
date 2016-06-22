class Form::ShopArea < ShopArea
    REGISTRABLE_ATTRIBUTES = %i(id shop_id area_id _destroy)

    def selectable_areas
        Area.all
    end
end
