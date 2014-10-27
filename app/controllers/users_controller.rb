# coding: utf-8
class UsersController < ApplicationController
  def show
    
  end
  
  def update_private_token
    current_user.update_private_token
    render text: current_user.private_token
  end
end