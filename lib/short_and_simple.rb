module ShortAndSimple
  
  def self.included(base)
    base.send :include, ShortAndSimpleHelpers
    base.send :define_method, :_short_url_redirect do
      obj = ShortUrl.retrieve(params[:short_url])
      dest_url = obj ? obj.long_url : '/'
      flash.keep
      redirect_to dest_url
    end
    base.action_methods << :_short_url_redirect
  end
  
end

module ShortAndSimpleHelpers
  
  def shortify_url(long_url)
    _short_url ShortUrl.remember(long_url)
  end
  
  def shortify_path(long_url)
    _short_path ShortUrl.remember(long_url)
  end
  
end

module ShortAndSimpleRouteHelpers
  
  def short_and_simple(prefix = '/u')
    path = "#{prefix}/:short_url"
    opts = { :controller => "application",
             :action => "_short_url_redirect",
             :requirements => { :short_url => /[\w\d]{8}/ } }
    @set.add_named_route(:_short, path, opts)
  end
    
end
