class Order < ApplicationRecord

    attr_accessor :select_option

    @user_full_name = "current_user.last_name" + " " + "current_user.first_name"

    validates :select_option, presence: true
    validates :payment_style, presence: true
    validates :user_name, presence: true

    belongs_to :user

    enum payment_style: ["クレジットカード", "銀行振込"]

end
