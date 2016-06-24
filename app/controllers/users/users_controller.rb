class Users::RegistrationsController < Devise::RegistrationsController
    def edit_after_signup
    end
    
    def update_after_signup
    end
end