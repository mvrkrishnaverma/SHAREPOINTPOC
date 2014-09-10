class CreateDocumentStores < ActiveRecord::Migration
  def change
    create_table :document_stores do |t|
      t.string :filename
      t.string :path
      
      t.references :user
      t.timestamps      
    end    
  end
end
