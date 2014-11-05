# coding: utf-8
module UsersHelper
  
  def user_avatar_width_for_size(size)
    case size
      when :normal then 48
      when :small then 16
      when :large then 64
      when :big then 120
      else size
    end
  end
  
  def user_avatar_size_name_for_2x(size)
    case size
    when :normal then :large
    when :small then :normal
    when :large then :big
    when :big then :big
    else size
    end
  end
  
  def owner?(item)
    item.user == current_user
  end
  
  def user_avatar_tag(user, size = :normal, opts = {})
    link = opts[:link] || true
    
    width = user_avatar_width_for_size(size)
    
    if user.blank?
      return image_tag("avatar/#{size}.png", class: "uface")
    end
    
    if user[:avatar].blank?
      img = image_tag("avatar/#{size}.png", class: "uface", style: "width:#{width}px;height:#{width}px;")
    else
      img = image_tag(user.avatar.url(user_avatar_size_name_for_2x(size)), class: "uface", style: "width:#{width}px;height:#{width}px;")
    end
    
    if link
      link_to(raw(img), user_path(user.nickname))
    else
      raw img
    end
    
  end
end