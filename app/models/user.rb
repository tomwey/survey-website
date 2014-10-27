# coding: utf-8
class User < ActiveRecord::Base
  
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, authentication_keys: [:login]
         
  attr_accessor :login, :password_confirmation   
  
  mount_uploader :avatar, AvatarUploader 
  ACCESSABLE_ATTRS = [:login, :nickname, :email, :by, :avatar, :password, :password_confirmation, :current_password]
  
  validates :nickname, format: { with: /\A\w+\z/, message: '只允许数字、大小写字母和下划线' },
                       length: { in: 3..20 }, presence: true, uniqueness: { case_sensitive: false }
  
  # 重写devise认证
  def self.find_for_database_authentication(warden_conditions)
    conditions = warden_conditions.dup
    if login = conditions.delete(:login)
      where(conditions).where(["lower(nickname) = :value OR lower(email) = :value", { value: login.downcase}]).first
    else
      where(conditions).first
    end
  end
  
  # 注册邮件提醒
  after_create :send_welcome_mail
  def send_welcome_mail
    UserMailer.welcome(self.id).deliver
  end
  
  def update_with_password(params = {})
    if !params[:current_password].blank? or !params[:password].blank? or !params[:password_confirmation].blank?
      super
    else
      params.delete(:current_password)
      self.update_without_password(params)
    end
  end
  
  def update_private_token
    random_key = "#{SecureRandom.hex(10)}:#{self.id}"
    self.update_attribute(:private_token, random_key)
  end
  
  def ensure_private_token!
    self.update_private_token if self.private_token.blank?
  end
end
