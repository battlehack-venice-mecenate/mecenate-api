class ApplicationController < ActionController::API
  before_action :set_access_control_headers

  def set_access_control_headers
    add_access_control_headers
    head(:ok) if request.request_method == "OPTIONS"
  end

  private

  def pagination_meta(collection)
    meta = { :page => collection.current_page, :total => collection.total_pages }
    meta.merge!(:next_url => url_for(params.merge(:page => collection.current_page + 1))) if !collection.last_page?
    meta.merge!(:prev_url => url_for(params.merge(:page => collection.current_page - 1))) if !collection.first_page?
    meta
  end

  def add_access_control_headers
    headers['Access-Control-Allow-Origin'] = '*'
    headers['Access-Control-Allow-Methods'] = 'POST, PUT, DELETE, GET, OPTIONS'
    headers['Access-Control-Request-Method'] = '*'
    headers['Access-Control-Allow-Headers'] = 'Origin, X-Requested-With, Content-Type, Accept, Authorization, Content-Disposition'
  end
end
