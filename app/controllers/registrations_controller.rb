class RegistrationsController < Devise::RegistrationsController
    skip_before_filter :require_no_authentication
    before_filter :resource_name

    def resource_name
      :user
    end

    def new
      @user = User.new
      @user.build_store
    end



    def create
      @user = User.new(user_params)
      if @user.role.blank?
        @user.role = "user"
      end
      if @user.save
        redirect_to root_path
        sign_in(resource_name, resource)
        yield resource if block_given?
      else
        render :action => 'new'
      end
    end

    protected

    #def sign_up(resource_name, resource)
    #  sign_in(resource_name, resource)
    #end
    #
    def after_sign_up_path_for(resource)
      after_sign_in_path_for(resource)
    end


    private

    def user_params
      params.require(:user).permit(:name, :lastname, :phone, :email, :address, :store_id, :avatar, :role, :password, :password_confirmation,
                                   :store_attributes => [:id, :name, :firstname, :lastname, :city, :bank, :account_owner, :account])
    end

end
