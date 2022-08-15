# frozen_string_literal: true

class NoodlesController < ApplicationController # :nodoc:
  before_action :set_noodles_params, only: %i[create]

  def create
    return render json: { time: message(@cook_time) } if [@hourglass_one, @hourglass_two].include?(@cook_time)

    time_min_max = [@hourglass_one, @hourglass_two].minmax

    Timeout.timeout(5) do
      while (time_min_max.max - time_min_max.min) != @cook_time

        difference = (time_min_max.max - time_min_max.min)

        if time_min_max[0] < time_min_max[1]
          time_min_max[0] = @hourglass_one
          time_min_max[1] = difference
        else
          time_min_max[0] = difference
          time_min_max[1] = @hourglass_two
        end

        @total_time += difference

        break if difference == @cook_time

      end

      render json: {
        time: message(@total_time)
      }
    end
  rescue Timeout::Error
    render json: { error: 'Não é possivel calcular o tempo' }
  end

  private

  def set_noodles_params
    @cook_time = noodle_params[:cook_time].to_i
    @hourglass_one = noodle_params[:hourglass_one].to_i
    @hourglass_two = noodle_params[:hourglass_two].to_i
    @total_time = @cook_time + [@hourglass_one, @hourglass_two].min
  end

  def message(total_time)
    "Tempo estimado de #{total_time} minutos"
  end

  def noodle_params
    params.require(:noodle).permit(:cook_time, :hourglass_one, :hourglass_two)
  end
end
