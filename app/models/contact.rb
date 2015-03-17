class Contact < MailForm::Base
  validates :name, :email, :message , presence: true
  validates :email, format: {with:/\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i}

  attribute :name, validate => true
  attribute :email, validate => true
  attribute :message

  def headers
    {
      subject: "RubyJJ Got A Problem",
      to: "fokayx@gmail.com",
      from: %("#{name}" <#{email}>)
    }
  end
end
