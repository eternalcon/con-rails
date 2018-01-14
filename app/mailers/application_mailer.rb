class ApplicationMailer < ActionMailer::Base
  default from: 'from@example.com'
  layout 'mailer'
  
  def set_locale
    I18n.locale = params[:locale] || I18n.default_locale
  end
  def self.default_url_options
    { locale: I18n.locale }
  end
end
