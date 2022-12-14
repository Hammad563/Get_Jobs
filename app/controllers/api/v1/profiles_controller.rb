class Api::V1::ProfilesController < Api::BaseController
    before_action :doorkeeper_authorize!

    def index
       profile = current_user.profile
       render json: profile, status: 200
    end

    def update_profile
        current_user.profile.update!(profile_params)
        current_user.profile.jobrole_list = params[:jobrole_list]
        current_user.profile.save!
        current_user.update!(name: params[:name])
        profile = current_user.profile
        render json: profile, status: 201
    end

    def create_work_exp
        work = WorkExperience.new({
            profile_id: work_exp_params[:profile_id],
            company: work_exp_params[:company],
            title: work_exp_params[:title],
            start_date: work_exp_params[:start_date],
            end_date: work_exp_params[:end_date],
            description: work_exp_params[:description],
            current_work: work_exp_params[:current_work],
        })
        if work.save!
            render json: work, status: 201
        else
            render json: {"error": "Could not create work experience"}, status: 400
        end
    end
    
    def update_work_exp
        work_experience = WorkExperience.find(params[:id])
        work_experience.update(create_work_exp)
        render json: {"msg": "success"}, status: 201
    end

    def delete_work_exp
        work_experience = WorkExperience.find_by(params[:profile_id])
        work_experience.destroy!
        render json: {"msg": "deleted work experience"}, status: 201

    end

    def create_education_params
        education = Education.new({
            profile_id: education_params[:profile_id],
            school: education_params[:school],
            education_type: education_params[:education_type],
            major: education_params[:major],
            gpa: education_params[:gpa],
            grad_date: education_params[:grad_date]
        })
        if education.save!
            render json: education, status: 201
        else
            render json: {"error": "Could not create education"}, status: 400
        end
    end

    
    def update_education
        edu = Education.find(params[:id])
        edu.update(education_params)
        render json: {"msg": "success"}, status: 201
    end

    def delete_education
        edu = Education.find(params[:id])
        edu.destroy!
        render json: {"msg": "deleted education"}, status: 201

    end





    #legacy
    def create_role
        role = Role.new({
            profile_id: roles_params[:profile_id],
            name: roles_params[:name],
            category: roles_params[:category]
        })
        if role.save!
            render json: role, status: 201
        else
            render json: {"error": "Could not create a role"}, status: 400
        end
    end
    #legacy
    def update_role
        profile_role = Role.find(update_role_params[:id])
        profile_role.update(update_role_params)
        render json: {"msg": "success"}, status: 201
    end
    #legacy
    def delete_role
        profile_role = Role.find(params[:id])
        profile_role.destroy!
        render json: {"msg": "success"}, status: 201
    end



    private
    def set_profile
        @profile = Profile.find_by(user_id: current_user.id)
    end

    def profile_params
        params.permit(:country, :state, :city, :experience, :bio, :url, :linked_in, :github, :achievements, :location_query)
    end
    def roles_params
        params.permit(:profile_id, :name, :category)
    end
    def work_exp_params
        params.permit(:profile_id, :company, :title, :start_date, :end_date, :current_work, :description)
    end
    def education_params
        params.permit(:profile_id, :school, :education_type, :major, :gpa, :grad_date)
    end
    def update_role_params
        params.permit(:id, :name, :category)
    end   

end