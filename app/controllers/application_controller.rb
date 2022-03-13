class ApplicationController < ActionController::Base
 before_action :configure_permitted_parameters, if: :devise_controller?


 def after_sign_in_path_for(resource)
  flash[:notice] = "ログインに成功しました。"
  customer_path(current_customer.id)
 end

 def after_sign_up_path_for(resource)
  flash[:notice] = "新規登録に成功しました。"
  customer_path(current_customer.id)
 end

 def after_sign_out_path_for(resource)
  flash[:notice] = "ログアウトに成功しました。"
  about_path
 end

 protected

 def configure_permitted_parameters
   devise_parameter_sanitizer.permit(:sign_up, keys: [:nickname])
 end

end
