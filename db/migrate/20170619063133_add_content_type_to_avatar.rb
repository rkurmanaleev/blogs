class AddContentTypeToAvatar < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :avatar_image_content_type, :string, default: "image/png"
  end
end
