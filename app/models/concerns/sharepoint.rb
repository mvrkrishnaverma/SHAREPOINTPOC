# Sharepoint API integration
module Sharepoint
  extend ActiveSupport::Concern
  
  module ClassMethods
    
    def client
      yaml = YAML.load_file(File.join(Rails.root, 'config', 'sharepoint.yml')).symbolize_keys    
      @client ||= Viewpoint::SPWSClient.new(yaml[:url], yaml[:username], yaml[:password])
    end
    
    # Get complete list of documents from sharepoint
    def lists
      client.get_lists
    end
  
    # Get given file from list of documents
    def all_items(list)
      client.get_list(list).items
    end
    
    # Add document to share point
    def add_document(folder_path)
      document_list = client.get_list(folder_path)
      document_list.add_file! file: File.join(Rails.root, 'public', 'uploads', 'documents')      
    end
    
    # Download document
    def download_document_from_share_point(file_ref)
      yaml = YAML.load_file(File.join(Rails.root, 'config', 'sharepoint.yml')).symbolize_keys    
      spcon = Viewpoint::SPWS::Connection.new(yaml[:url])
      spcon.set_auth(yaml[:username], yaml[:password])
      file = Viewpoint::SPWS::Websvc::Lists.new(spcon).get_file(file_ref)
      return file
    end
    
    
  end
    
end