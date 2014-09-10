class DocumentStore < ActiveRecord::Base
  include Sharepoint

  attr_accessor :url, :username, :password, :share_point_response
  
  def self.get_initial_list
    list_names = []
    #fetch List from Sharepoint & Iterate in Loop to fetch List Names
    lists.each do |list|
      list_names.push(list.title)
    end
    list_names
  end

  def self.get_list_items(list_name)
    list_names = []
    #fetch items of a List from Sharepoint & Iterate in Loop to fetch Item Names
    all_items(list_name).each do |list|
      list_names.push({:file_name => list.file_name, :file_ref => list.file_ref})
    end
    list_names
  end

  def self.download_item(file_ref)
    file_name = download_document_from_share_point(file_ref)
  end

end
