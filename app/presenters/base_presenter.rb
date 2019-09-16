class BasePresenter
  include Rails.application.routes.url_helpers
  require 'action_view'
  include ActionView::Helpers::NumberHelper
end
