class DeleteAttachmentResourceFromBooks < ActiveRecord::Migration[5.2]
  def change
    remove_attachment :books, :resource
  end
end
