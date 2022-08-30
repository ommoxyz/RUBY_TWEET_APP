class ApplicationController < ActionController::Base
    before_action :set_current_user

    # ログイン中のユーザ情報を取得
    def set_current_user
        @current_user = User.find_by(id: session[:user_id])
    end

    # 
    def authenticate_user
        @current_user = User.find_by(id: session[:user_id])

        if @current_user == nil
            flash[:notice] = "ログインが必要です"
            redirect_to("/login")
        end
    end
end
