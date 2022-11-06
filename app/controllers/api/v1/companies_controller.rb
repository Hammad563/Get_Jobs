class Api::V1::CompaniesController < Api::BaseController
    before_action :doorkeeper_authorize!
    def index
        companies = current_user.companies
        render json: companies, status: 200
    end

    def create_company
        company = Company.new({
            name: company_params[:name],
            approved: company_params[:approved],
            description: company_params[:description]
        })
        company.users << current_user
        company.save!
        render json: company, status: 201
    end

    def update_company
        company = Company.update(update_params)
        render json: {"msg": "Success"}, status: 201
    end
    

    private
    def company_params
        params.permit(:name, :approved, :rating, :description, )
    end
    def update_params
        params.permit(:name, :description, )
    end

end
