
    class InstrumentsController < ApplicationController
      def index
        render json: Instrument.includes(:users), include: 
          ['users']
      end
    end
 
