class ApplicationController < ActionController::API
  private

  def pagination_meta(collection)
    meta = { :page => collection.current_page, :total => collection.total_pages }
    meta.merge!(:next_url => url_for(params.merge(:page => collection.current_page + 1))) if !collection.last_page?
    meta.merge!(:prev_url => url_for(params.merge(:page => collection.current_page - 1))) if !collection.first_page?
    meta
  end
end
