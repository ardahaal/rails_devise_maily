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

  config.one_time_mailing :confirmation_instructions do |mailing|
    mailing.title = "Rails_Devise_Test_app - confirmation instructions"
    mailing.list = :all_users
    mailing.mailer_name = "UserMailer"
    mailing.start_at = Proc.new{|user| user.created_at}
    mailing.enable # mailings are disabled by default
  end

  config.ad_hoc_mailing :reset_password_instructions do |mailing|
    mailing.title = "Rails_Devise_Test_app - reset password instructions"
    mailing.list = :all_users
    mailing.mailer_name = "UserMailer"
    mailing.enable # mailings are disabled by default
  end

  config.ad_hoc_mailing :unlock_instructions do |mailing|
    mailing.title = "Rails_Devise_Test_app - unlock instructions"
    mailing.list = :all_users
    mailing.mailer_name = "UserMailer"
    mailing.enable # mailings are disabled by default
  end

  config.periodical_mailing :weekly_newsletter do |mailing|
    mailing.title = "Weekly newsletter"
    mailing.list = :all_users
    mailing.mailer_name = "UserMailer"
    mailing.start_at = Time.now + 5.minutes
    mailing.period = 1.week
    mailing.enable
  end
end
