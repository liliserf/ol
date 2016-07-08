class Api::BusinessesController < ApplicationController
  before_filter :restrict_access

  # Paginated collection of businesses in 50 record batches
  # If page number is valid, renders business records and meta data
  # Otherwise, renders error and code 404
  def index
    @businesses = Business.page(business_params[:page])

    if business_params[:page].to_i <= @businesses.total_pages.to_i
      render json: { businesses: serialized_businesses, 
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

  # Serialized record of individual business
  # If business exists with requested id, renders business record
  # Otherwise renders error and code 404
  def show
    @business = Business.find_by(id: business_params[:id])
    if @business
      render json: @business, status: 200
    else
      render json: { errors: t("api.errors.business.does_not_exist") }, status: 404
    end
  end

  private

  # Permitted params for business GET requests
  def business_params
    params.permit(:id, :page)
  end

  # Serializes collection of businesses with proper attribute
  # in order to serialize and maintain root
  def serialized_businesses
    ActiveModel::Serializer::CollectionSerializer.new(@businesses)
  end

  def restrict_access
    authenticate_or_request_with_http_token do |token, options|
      ApiKey.exists?(access_token: token)
    end
  end
end
