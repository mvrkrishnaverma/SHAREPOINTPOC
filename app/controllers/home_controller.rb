class HomeController < ApplicationController
  before_filter :authenticate_user!
  
  def index    
    if user_signed_in?
      @list = DocumentStore.get_initial_list
      render layout: 'dashboard'
    end 
  end
  
  def get_list_items
    @list_items = DocumentStore.get_list_items(params[:list_name])
    #render  @list_items.to_json
	render json: {items: @list_items}
  end
  
  def download_item
    file_item = DocumentStore.download_item(params[:file_ref])
    send_data file_item, :filename => params[:file_name], :disposition => 'attachment'
  end 
  
end
