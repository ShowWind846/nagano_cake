
[1mFrom:[0m /home/ec2-user/environment/nagano_cake/app/controllers/public/orders_controller.rb:26 Public::OrdersController#confirm:

     [1;34m9[0m: [32mdef[0m [1;34mconfirm[0m
    [1;34m10[0m:   @order = [1;34;4mOrder[0m.new(order_params)
    [1;34m11[0m:   @order.user_id = current_user.id
    [1;34m12[0m:   @cart_items = [1;34;4mCartItem[0m.where([35muser_id[0m:[current_user.id])
    [1;34m13[0m:   @sum = [1;34m0[0m
    [1;34m14[0m:   @user_full_name = current_user.last_name + [31m[1;31m"[0m[31m [1;31m"[0m[31m[0m + current_user.first_name
    [1;34m15[0m:   [32mif[0m params[[33m:order[0m][[33m:select_option[0m] == [31m[1;31m"[0m[31m0[1;31m"[0m[31m[0m
    [1;34m16[0m:     @order.user_address = current_user.address
    [1;34m17[0m:     @order.user_postal_code = current_user.postal_code
    [1;34m18[0m:     @order.user_name = @user_full_name
    [1;34m19[0m:   [32melsif[0m params[[33m:order[0m][[33m:select_option[0m] == [31m[1;31m"[0m[31m1[1;31m"[0m[31m[0m
    [1;34m20[0m:   [32melsif[0m params[[33m:order[0m][[33m:select_option[0m] == [31m[1;31m"[0m[31m2[1;31m"[0m[31m[0m
    [1;34m21[0m:     @order.user_address = order_params[[33m:user_address[0m]
    [1;34m22[0m:     @order.user_postal_code = order_params[[33m:user_postal_code[0m]
    [1;34m23[0m:     @order.user_name = order_params[[33m:user_name[0m]
    [1;34m24[0m:   [32mend[0m
    [1;34m25[0m:   binding.pry
 => [1;34m26[0m: [32mend[0m

