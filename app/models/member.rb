class Member < ActiveRecord::Base
  
  #apply_simple_captcha :message => " image and text were different"
  #2.3.2
  #file_column :photo
  #file_column :thumbnail
  #file_column :docs
  validates_presence_of :name, :message => 'is required'
  validates_uniqueness_of :name 
  validates_presence_of :password, :login_name, :email
  validates_presence_of :dob
  validates_file_format_of :photo, :in => ["gif", "jpg"]
  validates_filesize_of :photo, :in => 10.kilobytes..2.megabytes
  validates_filesize_of :thumbnail, :in => 10.bytes..256.kilobytes
  validates_filesize_of :docs, :in => 10.kilobytes..5.megabytes
  validates_file_format_of :docs, :in => ["doc", "txt","pdf","PDF"]
  validates_email_veracity_of :email, :domain_check => true, :message => ' is not correct.'
  
  Member.paginate :page => 1, :order => 'created_at DESC'
  
end
