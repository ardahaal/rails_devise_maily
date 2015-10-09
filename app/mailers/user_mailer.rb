class UserMailer < Devise::Mailer   
  helper :application # gives access to all helpers defined within `application_helper`.
  include Devise::Controllers::UrlHelpers # Optional. eg. `confirmation_url`
  default template_path: 'devise/mailer' # to make sure that your mailer uses the devise views

  def confirmation_instructions(record, opts={})
    @token = record.confirmation_token
    devise_mail(record, :confirmation_instructions, opts)
  end

  def reset_password_instructions(record, opts={})
    raw, enc = Devise.token_generator.generate(record.class, :reset_password_token)
    record.reset_password_token = enc
    record.save(:validate => false)
    @token = raw
    devise_mail(record, :reset_password_instructions, opts)
  end

  def unlock_instructions(record, opts={})
    raw, enc = Devise.token_generator.generate(record.class, :unlock_token)
    record.unlock_token = enc
    record.save(:validate => false)
    @token = raw
    devise_mail(record, :unlock_instructions, opts)
  end
end
