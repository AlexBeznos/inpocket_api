class MigrateImages < ActiveRecord::Migration[5.0]
  def self.up
    Place.find_each do |place|
      place.update(remote_logo_url: place.logo_identifier) if place.logo
    end

    User.find_each do |user|
      user.update(remote_photo_url: user.photo_identifier) if user.photo
    end

    Share.find_each do |share|
      share.update(remote_image_url: share.image_identifier) if share.image
    end

    Present.find_each do |present|
      present.update(remote_image_url: present.image_identifier) if present.image
    end

    MenuItem.find_each do |menu_item|
      menu_item.update(remote_image_url: menu_item.image_identifier) if menu_item.image
    end

    Feedback.find_each do |feedback|
      feedback.update(remote_image_url: feedback.image_identifier) if feedback.image
    end

  end

  def self.down
  end
end
