class TestDrivesController < ApplicationController
      before_action :authenticate_request!

def index
      test_drives = TestDrive.all

        render json: test_drives.as_json
end


      def create
        @test_drive = TestDrive.new(test_drive_params)
    
        if @test_drive.save
          # Handle successful test drive request
          render json: { success: true }, status: :created
        else
          # Handle unsuccessful test drive request
          render json: { error: @test_drive.errors.full_messages.join(', ') }, status: :unprocessable_entity
        end
      end
    
      private
    
      def test_drive_params
        params.permit(:member_id, :car_id, :phone, :date)
      end
end
