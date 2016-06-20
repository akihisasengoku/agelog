class ShopsController < ApplicationController
  before_action :set_shop, only: [:show, :edit, :update, :destroy]

  # GET /shops
  # GET /shops.json
  def index
    @shops = Form::Shop.all
  end

  # GET /shops/1
  # GET /shops/1.json
  def show
    @micropost = current_user.microposts.build if logged_in?
    @microposts = @shop.microposts.order(created_at: :desc)
    @users = @shop.users.uniq
  end

  # GET /shops/new
  def new
    @shop = Form::Shop.new
  end

  # GET /shops/1/edit
  def edit
  end

  # POST /shops
  # POST /shops.json
  def create
    @shop = Form::Shop.new(shop_params)
    @coodinates = {}
    @coodinates["lat"] = @shop[:latitude]
    @coodinates["lng"] = @shop[:longitude]
    @shop[:address] = reverse_geocode_yolp(@coodinates)

    respond_to do |format|
      if @shop.save
        format.html { redirect_to shop_path(@shop), notice: 'Shop was successfully created.' }
        format.json { render :show, status: :created, location: @shop }
      else
        format.html { render :new }
        format.json { render json: @shop.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /shops/1
  # PATCH/PUT /shops/1.json
  def update
    respond_to do |format|
      if @shop.update(shop_params)
        format.html { redirect_to shop_path(params[:id]), notice: 'Shop was successfully updated.' }
        format.json { render :show, status: :ok, location: @shop }
      else
        format.html { render :edit }
        format.json { render json: @shop.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /shops/1
  # DELETE /shops/1.json
  def destroy
    @shop.destroy
    respond_to do |format|
      format.html { redirect_to shops_url, notice: 'Shop was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_shop
      @shop = Form::Shop.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def shop_params
      params.require(:form_shop)
            .permit(Form::Shop::REGISTRABLE_ATTRIBUTES +
            [shop_categories_attributes: Form::ShopCategory::REGISTRABLE_ATTRIBUTES]
            )
    end
    
    # Yahoo!リバースジオコーダAPI
    def reverse_geocode_yolp(coordinates)
    
      puts "Reverse Geocode by Yahoo!リバースジオコーダAPI"
    
      lat = coordinates['lat'].to_s
      lng = coordinates['lng'].to_s
    
      # 出力形式にJSONを指定する
      reqUrl = "#{ENV['BASE_URL_YOLP_REVERSE_GEOCODER']}?appid=#{ENV['YAHOO_APP_ID']}&lat=#{lat}&lon=#{lng}&output=json"
    
      #p reqUrl # for DEBUG
      response = Net::HTTP.get_response(URI.parse(reqUrl))
    
      # レスポンスコードのチェック
      # 詳細は http://magazine.rubyist.net/?0013-BundledLibraries
      case response
      # 200 OK
      when Net::HTTPSuccess then
        data = JSON.parse(response.body)
        #p status # for DEBUG
        address = data['Feature'][0]['Property']['Address']
      # それ以外
      else
        address = ""
      end

    end
end
