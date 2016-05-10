class FriendsController < ApplicationController
  before_action :set_friend, only: [:show, :edit, :update, :destroy]

  def new
    @friend = Friend.new
  end

  def index
    @friends = Friend.all
  end

  def show
  end

  def create
    @friend = Friend.new(friend_params)

    respond_to do |format|
      if @friend.save
        format.html { redirect_to @friend, notice: 'Friend was successfully created.' }
        format.json { render action: 'show', status: :created, location: @friend }
      else
        format.html { render action: 'new' }
        format.json { render json: @friend.errors, status: :unprocessable_entity }
      end
    end
  end

private

  def set_friend
    @friend = Friend.find(params[:id])
  end

  def friend_params
    params.require(:friend).permit(:avatar, :name)
  end

end
