I18n.load_path += Dir[Rails.root.join('config', 'locales', '*.{rb,yml}').to_s]
I18n.locale = :'pt-BR'

Rails.application.config.i18n.locale = :'pt-BR'
Rails.application.config.i18n.default_locale = :'pt-BR'
Rails.application.config.i18n.available_locales = [:'pt-BR', :en]
