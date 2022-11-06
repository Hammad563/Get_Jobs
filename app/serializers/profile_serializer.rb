class ProfileSerializer < ActiveModel::Serializer
  attributes :id, :user, :country, :city, :state, :experience, :bio, :url, :linked_in, :github, :achievements, :created_at, :updated_at, :location_query, :jobrole_list, :work_experience

  def work_experience
    self.object.work_experience.map do |exp|
      {
        company: exp.company,
        title: exp.title,
        start_date: exp.start_date,
        end_date: exp.end_date,
        current_work: exp.current_work,
        description: exp.description
      }
    end
  end

end
