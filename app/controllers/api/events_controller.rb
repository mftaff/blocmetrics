class API::EventsController < ApplicationController
    skip_before_action :verify_authenticity_token
    skip_before_action :authenticate_user!
    
    before_filter :set_access_control_headers
    
    def set_access_control_headers
        headers['Access-Control-Allow-Origin'] = '*'
        headers['Access-Control-Allow-Methods'] = 'POST , GET, OPTIONS'
        headers['Access-Control-Allow-Headers'] = 'Content-Type'
    end
    
    def create
        registered_application = RegisteredApp.find_by(url: request.env['HTTP_ORIGIN'])
        
        if registered_application.nil?
            render json: "Unregistered application", status: :unprocessable_entity
        else
            @event = Event.create!(
                registered_app: registered_application,
                name: request.filtered_parameters["event"]["name"]
            )
            
            if @event.save
                render json: @event, status: :created
            else
                render json: { errors: @event.errors}, status: :unprocessable_entity
            end
        end
    end
    
    def preflight
        head 200
    end
    
    private
    
    def event_params 
        params.require(:event).permit(:name)
    end
end