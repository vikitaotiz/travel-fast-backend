class Api::V1::ReservationsController < ApplicationController
  def index
    # show reservations that belongs to a user
    if params[:user_id]
      @reservations = []
      Reservation.where(user_id: params[:user_id]).each do |rs|
        data = {}
        data['id'] = rs.id
        data['car_id'] = rs.car_id
        data['car_name'] = Car.find(rs.car_id).name if rs.car_id
        data['user_id'] = rs.user_id
        data['city'] = rs.city
        data['start_date'] = rs.start_date
        data['end_date'] = rs.end_date
        data['created_at'] = rs.created_at

        @reservations << data
      end

      render json: { data: @reservations }, status: :created
    else
      render json: { message: 'User ID is required' }
    end
  end

  def create
    # create new reservation
    @reservation = Reservation.new(reservations_params)

    if @reservation.save
      render json: { message: 'Reservation created successfully', data: @reservation }, status: :created
    else
      render json: { message: 'There was an error successfully' }, status: :unauthorized
    end
  end

  def destroy
    reservation = Reservation.find(params[:id])
    if reservation
      reservation.delete
      render json: { message: 'Reservation deleted' }, status: :ok
    else
      render json: { message: 'Reservation not found' }, status: :ok
    end
  end

  private

  def reservations_params
    params.require(:reservation).permit(
      :user_id,
      :car_id,
      :city,
      :start_date,
      :end_date
    )
  end
end
