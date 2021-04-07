class Order < ApplicationRecord

    attr_accessor :select_option,:user

    @user_full_name = "current_user.last_name" + " " + "current_user.first_name"
    
    belongs_to :user
    has_many :order_details, dependent: :destroy

    enum payment_style: ["クレジットカード", "銀行振込"]

end
