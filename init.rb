require 'short_url'
require 'short_and_simple'

ActionController::Routing::RouteSet::Mapper.send :include, ShortAndSimpleRouteHelpers
ActionView::Base.send :include, ShortAndSimpleHelpers