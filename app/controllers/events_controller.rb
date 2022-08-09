class EventsController < ApplicationController
    before_action :set_event, only: %i[ show edit update ]

    def show; end

    def new
        @event = Event.new
    end

    def create
        @event = Event.create(event_params)
        
        if @event.save
            redirect_to root_path, notice: 'Evento criado com sucesso!'
        else
            render :new, status: :unprocessable_entity
        end
    end

    def edit; end

    def update
        if @event.update(event_params)
            redirect_to root_path, notice: 'Evento editado com sucesso!'
        else
            render :edit, status: :unprocessable_entity
        end
    end

    private

    def set_event
        @event = Event.find(params[:id])
    end

    def event_params
        params.require(:event).permit(:title, :description, :start_time, :end_time)
    end
end
