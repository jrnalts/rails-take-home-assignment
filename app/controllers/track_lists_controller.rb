# frozen_string_literal: true

class TrackListsController < ApplicationController
  before_action :authenticate_user!
  before_action :find_track_list, only: %i[edit update destroy serialize]
  after_action :reset_track_list_serial, only: %i[destroy]

  def index
    @track_lists = user_track_lists.order_with_serial.includes(:stocks)
  end

  def new
    @track_list = user_track_lists.new
  end

  def create
    serials = user_track_lists.order_with_serial.pluck(:serial)
    @track_list = user_track_lists.new(track_list_params)

    # If user already has track lists, give serial after the last one
    @track_list.serial = serials.max + 1 unless serials.blank?

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

    redirect_to track_lists_path, notice: "已刪除 #{@track_list.title}!"
  end

  def serialize
    case params[:position]
    when 'up'
      @track_list.serial_up
    when 'down'
      @track_list.serial_down
    end

    redirect_to track_lists_path
  end

  private

  def find_track_list
    @track_list = user_track_lists.find(params[:id])
  end

  def track_list_params
    params.require(:track_list).permit(:title)
  end

  def reset_track_list_serial
    lists_with_serial = user_track_lists.order_with_serial.where('serial > ?', @track_list.serial)
    return if lists_with_serial.blank?

    lists_with_serial.update_all('serial = serial - 1')
  end
end