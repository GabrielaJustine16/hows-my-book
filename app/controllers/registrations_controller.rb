class RegistrationsController < Devise::RegistrationsController

    private 

    def signup_params
        params.require(:user).permit(:email,:password,:password_configuration)

    end 

    def account_update_params
        params.require(:user).permit(:email,:password,:password_configuration)



    end



    
  end