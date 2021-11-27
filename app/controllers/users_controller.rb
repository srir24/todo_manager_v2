class UsersController < ApplicationController
  skip_before_action :verify_authenticity_token

  def index
    render plain: User.order(:name).map { |user| user.to_pleasant_user }.join("\n")
  end

  def create
    name = params[:name]
    email = params[:email]
    password = params[:password]
    user = User.create!(name: name, email: email, password: password)
    render_txt = "User created with Id #{user.id}"
    render plain: render_txt
  end

  def login
    email = params[:email]
    password = params[:password]
    user = User.find_by(email: email, password: password)
    render_txt = user ? "true" : "false"
    render plain: render_txt
  end
end
