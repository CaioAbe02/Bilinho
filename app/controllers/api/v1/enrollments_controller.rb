module Api
  module V1
    class EnrollmentsController < ApplicationController
      before_action :set_enrollment, only: %i[show update destroy]

      # GET /enrollments
      def index
        @enrollments = Enrollment.all

        render json: @enrollments
      end

      # GET /enrollments/1
      def show
        render json: @enrollment
      end

      # POST /enrollments
      def create
        @enrollment = Enrollment.new(enrollment_params)

        if @enrollment.save
          render json: { status: 'SUCCESS', message: 'Saved enrollment', data: @enrollment }, status: :ok
        else
          render json: { status: 'ERROR', message: 'Enrollment not saved', data: @enrollment.errors },
                 status: :unprocessable_entity
        end
      end

      # PATCH/PUT /enrollments/1
      def update
        if @enrollment.update(enrollment_params)
          render json: @enrollment
        else
          render json: @enrollment.errors, status: :unprocessable_entity
        end
      end

      # DELETE /enrollments/1
      def destroy
        @enrollment.destroy
      end

      private

      # Use callbacks to share common setup or constraints between actions.
      def set_enrollment
        @enrollment = Enrollment.find(params[:id])
      end

      # Only allow a list of trusted parameters through.
      def enrollment_params
        params.require(:enrollment).permit(:valor_curso, :qtd_bills, :dia_vencimento_bill, :nome_curso,
                                           :institution_id, :enrollment_id)
      end
    end
  end
end
