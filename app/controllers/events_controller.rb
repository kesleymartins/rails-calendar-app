class EventsController < ApplicationController
    before_action :set_event, only: %i[ show edit update ]

    def show; end

    def new
        @event = Event.new
    end

    def create
        @event = Event.new(event_params)
        
        if @event.save
            redirect_to root_path, notice: 'Evento criado com sucesso!'
        else
            render(turbo_stream: turbo_stream.replace('events_form', partial: 'events/form', locals: { event: @event }))
        end
    end

    def edit; end

    def update
        if @event.update(event_params)
            redirect_to root_path, notice: 'Evento editado com sucesso!'
        else
            render(turbo_stream: turbo_stream.replace('events_form', partial: 'events/form', locals: { event: @event }))
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
