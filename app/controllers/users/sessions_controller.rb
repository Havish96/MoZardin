# frozen_string_literal: true

class Users::SessionsController < Devise::SessionsController
  # before_action :configure_sign_in_params, only: [:create]

  # GET /resource/sign_in
  # def new
  #   super
  # end

  # POST /resource/sign_in
  def create
    super
    if current_user.lists.count.zero?
      list = List.create!(name: current_user.nickname, user_id: user.id)
    else
      list = List.find_by(user_id: current_user.id)
    end

    current_user.gardens.each do |garden|
      garden.plants do |plant|
        new_task = Task.new(name: plant.name, description: 'Please water your plant [NO RAIN TODAY]', done: false,
                            plant_id: plant.id,
                            list_id: list.id)
        new_task.save
      end
    end
    # TasksController.generate_tasks(current_user)
  end

  # DELETE /resource/sign_out
  # def destroy
  #   super
  # end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end
end
