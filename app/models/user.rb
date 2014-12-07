class User < ActiveRecord::Base
  validates :nick, length: { minimum: 5, maximum: 20 },
            format: { with: /\A[a-zA-Z0-9]+\z/,
                      message: I18n.t('activerecord.errors.models.user.attributes.nick.only_letters_and_digits')}
  validate :isNickAvaliable
  validates :pass, length: { minimum: 6, maximum: 30 }
  validate :passNotEqualToNick
  validates :email, email_format: {message: I18n.t('activerecord.errors.models.user.attributes.email.incorrect_mail')}
  validate :isEmailAvaliable
  validates_date :birth, :before => Time.now
  validates :lang, numericality: { greater_than: 0, less_than: 4 }

  private
  def passNotEqualToNick
    errors.add(:pass, I18n.t('activerecord.errors.models.user.attributes.pass.should_be_different_with_nickname')) if nick == pass
  end
  def isNickAvaliable
    errors.add(:nick, I18n.t('activerecord.errors.models.user.attributes.nick.is_using')) if User.exists?(nick: nick)
  end
  def isEmailAvaliable
    errors.add(:email, I18n.t('activerecord.errors.models.user.attributes.email.is_using')) if User.exists?(email: email)
  end
end
