class UserSessionsController < ApplicationController 

  skip_before_filter :require_login, except: [:destroy] 
  
  def new 
     @user = User.new 
  end 
 
  def create 
     if @user = login(params[:email], params[:password]) 
       redirect_back_or_to(:home, notice: 'Bienvenido a SANO') 
     else 
       flash.now[:alert] = 'Correo o Contraseña incorrecta' 
       render action: 'new' 
     end 
  end 
 
  def destroy 
     logout 
     redirect_to(root_url, notice: 'Desconectado!') 
  end 
 
end 
 
 
