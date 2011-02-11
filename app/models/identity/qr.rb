require 'digest/md5'

class Identity::QR < Identity
  
  before_create :generate_identity
  
  def generate_identity
    self.data = Digest::MD5.hexdigest(Time.current.to_s)
  end
  
end