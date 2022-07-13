# frozen_string_literal: true

class TrackListStocksController < ApplicationController
  before_action :authenticate_user!
  before_action :find_track_list, only: [:new]
  before_action :find_track_list_stock, only: [:destroy]

  def new
    @track_list_stock = TrackListStock.new
  end

  def create
    stock = Stock.available.find_by(code: params[:stock_id])
    return redirect_to new_track_list_stock_path, notice: '股票代號不存在' if stock.blank?

    track_list_stock = TrackListStock.find_by(
      track_list_id: track_list_id,
      stock_id: stock.id
    )
    if track_list_stock.present?
      redirect_to new_track_list_stock_path, notice: '已新增過這支股票'
    else
      @track_list_stock = TrackListStock.new(
        track_list_id: track_list_id,
        stock_id: stock.id)
      redirect_to track_lists_path if @track_list_stock.save
    end
  end

  def destroy
    @track_list_stock.destroy if @track_list_stock
    redirect_to track_lists_path
  end

  private

  def find_track_list
    @track_list = user_track_lists.find(track_list_id)
  end

  def find_track_list_stock
    @track_list_stock = TrackListStock.find_by(track_list_id: track_list_id, stock_id: params[:stock_id])
  end

  def track_list_id
    params[:track_list_id]
  end
end
