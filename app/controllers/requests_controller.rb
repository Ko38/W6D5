class RequestsController < ApplicationController

    def index
        @requests = Catrentalrequest.all.order(:start_date)
        render :index
    end

    def new
        @cats = Cat.all
        render :new
    end

    def create 
        new_request = Catrentalrequest.new(params.require(:request).permit(:cat_id,:start_date, :end_date))
        if new_request.save
            redirect_to requests_url
        else
            render json: new_request.errors.full_messages, status: 422
        end
    end
end
