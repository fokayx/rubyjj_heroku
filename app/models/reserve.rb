class Reserve < ActiveRecord::Base
  validates :name, :phone, :email, :accepts, presence: true
  validates :email, format: {with:/\A([\w\.%\+\-]+)@([\w\-]+\.)+([\w]{2,})\z/i}

end
