class UserMailer < Devise::Mailer   
  helper :application # gives access to all helpers defined within `application_helper`.
  include Devise::Controllers::UrlHelpers # Optional. eg. `confirmation_url`
  default template_path: 'devise/mailer' # to make sure that your mailer uses the devise views

  def confirmation_instructions(record, opts={})
    @token = record.confirmation_token
    devise_mail(record, :confirmation_instructions, opts)
  end

  def reset_password_instructions(record, opts={})
    @token = record.reset_password_token
    devise_mail(record, :reset_password_instructions, opts)
  end

  def unlock_instructions(record, opts={})
    @token = record.unlock_token
    devise_mail(record, :unlock_instructions, opts)
  end

  def password_change(record, opts={})
    devise_mail(record, :password_change, opts)
  end
end
