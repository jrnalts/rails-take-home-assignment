# frozen_string_literal: true

class TrackListsController < ApplicationController
  before_action :authenticate_user!
  before_action :find_track_list, only: [:edit, :update, :destroy]

  def index
    @track_lists = user_track_lists.includes(:stocks)
  end

  def new
    @track_list = user_track_lists.new
  end

  def create
    @track_list = user_track_lists.new(track_list_params)

    if @track_list.save
      redirect_to track_lists_path
    else
      render :new
    end
  end

  def edit; end

  def update
    if @track_list.update(track_list_params)
      redirect_to track_lists_path
    else
      render :edit
    end
  end

  def destroy
    @track_list.destroy if @track_list
    redirect_to track_lists_path
  end

  private

  def find_track_list
    @track_list = user_track_lists.find(params[:id])
  end

  def track_list_params
    params.require(:track_list).permit(:title)
  end
end