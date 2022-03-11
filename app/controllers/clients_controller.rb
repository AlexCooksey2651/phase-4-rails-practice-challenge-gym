class ClientsController < ApplicationController
    rescue_from ActiveRecord::RecordNotFound, with: :client_not_found
    
    def index
        clients = Client.all
        render json: clients
    end
    
    def show
        client = Client.find(params[:id])
        # render json: client, include: :memberships
        render json: client
    end

    def update
        client = Client.find(params[:id])
        client.update!(client_params)
        render json: client
    end

    private 

    def client_not_found
        render json: {error: "Client not found"}, status: :not_found
    end

    def client_params
        params.permit(:name, :age)
    end
end
