class JobsPublishedDenormalizer
    attr_reader :jobs_published
    def initialize(jobs_published)
        @jobs_published = jobs_published
    end

    def to_hash
        %w[id
           id
           user_id
           title
           city
           state
           country
           current_job_type
           remote
           hire_in_country
           description
           status
           created_at
           updated_at
           company_id
           location_query
           salary_range
           job_q
           benefits  
           company_name
           ]
          .map { |method_name| [method_name, send(method_name)] }.to_h
      end

      def id
        jobs_published.id
      end

      def user_id
        jobs_published.user_id
      end

      def title
        jobs_published.title
      end

      def city
        jobs_published.city
      end

      def state
        jobs_published.state
      end

      def country
        jobs_published.country
      end

      def current_job_type
        jobs_published.current_job_type
      end

      def remote
        jobs_published.remote
      end

      def hire_in_country
        jobs_published.hire_in_country
      end

      def description
        jobs_published.description
      end

      def status
        jobs_published.status
      end

      def created_at
        jobs_published.created_at
      end

      def updated_at
        jobs_published.updated_at
      end

      def company_id
        jobs_published.company_id
      end

      def location_query
        jobs_published.location_query
      end

      def salary_range
        jobs_published.salary_range
      end

      def job_q
        jobs_published.job_q
      end

      def benefits
        jobs_published.benefits
      end

      def company_name
        jobs_published.company.name
      end

end