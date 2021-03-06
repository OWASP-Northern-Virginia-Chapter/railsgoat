class User < ActiveRecord::Base
  attr_accessible :email, :password, :user_id, :admin, :password_confirmation, :first_name, :last_name
  validates_confirmation_of :password, :password_confirmation
  validates :password, :presence => true,
                        :confirmation => true,
                        :length => {:within => 6..40}
  validates_presence_of :email
  validates_uniqueness_of :email
  validates_format_of :email, :with => /.+@.+\..+/i
  
  def self.authenticate(email, password)
       auth = nil
       user = find_by_email(email)
       # I heard something about hashing, dunno, why bother really. Nobody will get access to my stuff!
       if user && user.password == password
        auth = user
       end
       return auth
  end
    
end
