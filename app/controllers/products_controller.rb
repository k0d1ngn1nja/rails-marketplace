class ProductsController < ApplicationController
  before_action :set_product, only: [:edit, :update, :show, :destroy]

  def index
    @products = Product.all
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      if params['images']
        params['images'].each do |img|
          @product.photos.create(image: img)
        end
      end
      @photos = @product.photos

      flash[:succes] = "Product Added!"
      redirect_to products_path
    else
      flash.now[:danger] = "Product couldn't be added"
      render :new
    end
  end

  def edit
    @photos = @product.photos
  end

  def update
    if @product.update(product_params)
      if params['images']
        params['images'].each do |img|
          @product.photos.create(image: img)
        end
      end
      flash[:success] = "Product details has been updated"
      redirect_to @product
    else
      flash.now[:danger] = "Oops!, something went wrong. Please try again."
      render :edit
    end
  end

  def show
    @photos = @product.photos
  end

  def destroy
    @product.destroy
    flash[:success] = "Product has been deleted!"
    redirect_to root_path
  end

  private
    def set_product
      @product = Product.find(params[:id])
    end

    def product_params
      params.require(:product).permit(:title, :description, :price, :photo_id)
    end
end
