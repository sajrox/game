require 'digest/sha1'

class Member < ActiveRecord::Base
  attr_protected :id, :salt
  attr_accessor :password, :password_confirmation

  validates_presence_of :login, :email, :password, :password_confirmation, :salt

  def password=(pass)
    @password = pass

    self.salt = Member.generate_salt
    self.hpassword = Member.hashed_password(pass, self.salt)
  end

  def self.generate_salt(len=6)
    chars = ("a".."z").to_a + ("A".."Z").to_a + ("0".."9").to_a

    newsalt = ''
    1.upto(len) { |i| newsalt << chars[rand(chars.size-1)] }
    return newsalt
  end

  def self.hashed_password(pass, salt)
    Digest::SHA1.hexdigest(pass + salt)
  end
end
