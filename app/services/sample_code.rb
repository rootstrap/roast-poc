# frozen_string_literal: true

class UserService
  def initialize(user)
    @user = user
  end

  def process_payment(amount)
    if amount > 0
      @user.balance -= amount
      @user.save
      return true
    else
      return false
    end
  end

  def send_notification(message)
    if @user.email.present?
      UserMailer.notification(@user, message).deliver_now
    end
  end
end 