class Users::RegistrationsController < Devise::RegistrationsController
  before_action :configure_sign_up_params, only: [:create]
  before_action :configure_account_update_params, only: [:update]

  # GET /resource/sign_up
  def new
    super
  end

  # POST /resource
  def create
    # Добавьте проверку на существующего пользователя по email
    existing_user = User.find_by(email: sign_up_params[:email])

    if existing_user
      flash[:error] = "This email address is already in use."
      redirect_to new_user_registration_path
    else
      super do |resource|
        # Перенаправляем пользователя на страницу Dashboard после успешной регистрации
        sign_in(resource) # Автоматически входим пользователя после регистрации
        redirect_to dashboard_path
        return  # Add this 'return' statement to exit the action
      end
    end
  end

  # GET /resource/edit
  def edit
    super
  end

  # PUT /resource
  def update
    super
  end

  # DELETE /resource
  def destroy
    super
  end

  protected

  # If you have extra params to permit, append them to the sanitizer.
  def configure_sign_up_params
    devise_parameter_sanitizer.permit(:sign_up, keys: [:attribute1, :attribute2]) # Замените :attribute1 и :attribute2 на ваши атрибуты
  end

  # If you have extra params to permit, append them to the sanitizer.
  def configure_account_update_params
    devise_parameter_sanitizer.permit(:account_update, keys: [:attribute1, :attribute2]) # Замените :attribute1 и :attribute2 на ваши атрибуты
  end
end
