class ShortUrl < ActiveRecord::Base
  
  validates_uniqueness_of :short_url, :on => :create
  
  def self.remember(long_url)
    opts = { :long_url => long_url.to_s, 
             :short_url => generate_short_url(long_url) }
    obj = create(opts)
    if obj.new_record?
      retrieve( generate_short_url(long_url) )
    else
      obj
    end.short_url
  end
  
  def self.retrieve(short_url)
    find(:first, :conditions => ['short_url=?', short_url])
  end
  
protected
  
  def self.generate_short_url(long_url)
    Digest::SHA1.hexdigest(long_url.to_s)[0,8]
  end
  
end