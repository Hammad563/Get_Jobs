class Api::V1::JobsPublishedsController < Api::BaseController
    before_action :doorkeeper_authorize!

    def index
        company = Company.find(params[:id])
        jobs = company.jobs_publisheds.order(created_at: "DESC" )
        render json: jobs, status: 200
    end
    
    def create
        @company = Company.find(jobs_params[:companies_id])
        job = JobsPublished.create!({
            user_id: current_user.id,
            company_id: @company.id,
            title: jobs_params[:title],
            city: jobs_params[:city],
            state: jobs_params[:state],
            country: jobs_params[:country],
            location_query: jobs_params[:location_query],
            current_job_type: jobs_params[:current_job_type],
            remote: jobs_params[:remote],
            hire_in_country: jobs_params[:hire_in_country],
            experience: jobs_params[:experience],
            description: jobs_params[:description],
            benefits: jobs_params[:benefits],
            salary_range: jobs_params[:salary_range],
            job_q: jobs_params[:job_q]
        })
        if job.save
            render json: {"msg": "success"}, status: 201 
        else
            render json: {"error": "Could not create the job"}, status: 400
        end
    end

    def company_specific_job
        @job = JobsPublished.find(params[:id])
        render json: @job, status: 200
    end

    def update_job_status
        @job = JobsPublished.find(params[:id])
        @job.update(status: params[:status])
        render json: {"msg": "success"}, status: 201
    end

    def update
    end

    def delete
    end


    private

    def jobs_params
        params.permit(:companies_id, :title, :city, :state, :country, :location_query, :current_job_type, :remote, :hire_in_country, :experience, :description, :status, job_q: [], salary_range: [], benefits: [] )
    end

end
