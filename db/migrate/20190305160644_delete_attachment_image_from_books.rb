class DeleteAttachmentImageFromBooks < ActiveRecord::Migration[5.2]
  def change
    remove_attachment :books, :image
  end
end
