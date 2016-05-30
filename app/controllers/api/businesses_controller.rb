class Api::BusinessesController < ApplicationController

  def index
    @businesses = Business.page(business_params[:page])

    if business_params[:page].to_i <= @businesses.total_pages.to_i
      render json: { businesses: @businesses, 
                   meta: { pagination: { 
                            per_page: Business.default_per_page, 
                            total_pages: @businesses.total_pages, 
                            total_businesses: @businesses.total_count,
                            current_page: @businesses.current_page } } }, 
             status: 200 
    else
      render json: { errors: t("api.errors.pagination.pagination_exceeded") }, status: 404
    end
  end

  def show
    @business = Business.find_by(id: business_params[:id])
    if @business
      render json: @business, status: 200
    else
      render json: { errors: t("api.errors.business.does_not_exist") }, status: 404
    end
  end

  private

  def business_params
    params.permit(:id, :page)
  end
end
