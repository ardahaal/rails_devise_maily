MailyHerald.setup do |config|
  config.context :all_users do |context|
    context.scope {User.all}
    context.destination {|user| user.email}
    context.attributes do |user| 
      attribute_group(:user) do
        attribute(:email) {user.email}
        attribute(:created_at) {user.created_at}
      end
    end
  end

  config.list :all_users do |list|
    list.context_name = :all_users
  end

  config.ad_hoc_mailing :confirmation_instructions do |mailing|
    mailing.title = "Rails_Devise_Test_app - confirmation instructions"
    mailing.list = :all_users
    mailing.mailer_name = "Devise::Mailer"
    mailing.enable # mailings are disabled by default
  end

  config.ad_hoc_mailing :reset_password_instructions do |mailing|
    mailing.title = "Rails_Devise_Test_app - reset password instructions"
    mailing.list = :all_users
    mailing.mailer_name = "Devise::Mailer"
    mailing.enable # mailings are disabled by default
  end

  config.ad_hoc_mailing :unlock_instructions do |mailing|
    mailing.title = "Rails_Devise_Test_app - unlock instructions"
    mailing.list = :all_users
    mailing.mailer_name = "Devise::Mailer"
    mailing.enable # mailings are disabled by default
  end

  config.ad_hoc_mailing :password_change do |mailing|
    mailing.title = "Rails_Devise_Test_app - password change"
    mailing.list = :all_users
    mailing.mailer_name = "Devise::Mailer"
    mailing.enable # mailings are disabled by default
  end
end