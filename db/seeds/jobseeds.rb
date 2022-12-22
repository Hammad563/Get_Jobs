ActiveRecord::Base.transaction do
    PROFESSIONS = ["Software Developer", "Developer", "Java Developer", "Software Developer II", "DevOps Engineer", "Staff Engineer", "Principle Engineer", "Ruby on Rails Engineer", "Ruby on Rails Developer", "Entry level Developer", "Php Developer", ".Net Developer", "C# Developer II", "C# Engineer",
         "Database Analyst", "Systems Engineer", "Associate Developer", "Full Stack Developer", "Full Stack Developer II", "React Engineer", "Kotlin developer", "IOS Developer", "Mobile Engineer", "Software Developer", "Senior Software Engineer", "Senior Software Engineer"]
    JOB_TYPE = ["Full Time", "Full Time", "Full Time", "Full Time", "Part Time", "Full Time", "Co_op", "Full Time", "On_call"]
    EXPERIENCE = [0,1,2,3,4,5,10]
    BENEFITS = ["Pension", "Dental Care", "Health Care", "Vision Care", "401k", "Casual dress", "Flexible", "Paid Time Off", "RRSP Match"]
    JQ = ["C# .Net", ".Net", "Strong Object Oriented Design", "OOP", "Angular", "Azure", "PostgreSQL", "SQL", "Proven experience as a Software Engineer", "Javascript", "React", "Ruby", "Spring Boot", "Python","Attention to detail", "Independent","Ruby on Rails", "Java", "Kubernetes", "AWS", "Proven ", "University Degree", "Ruby on Rails experience", "Strong problem solving skills", "Strong knowledge and understanding of Java, Spring Boot, Kafka, Cassandra, Rest API, and Spark"]


    10.times do
        user = User.create(email: Faker::Name.first_name + "@gmail.com", name: Faker::Name.name, password: Faker::Lorem.characters(number: 10))
        company = Company.create(description: Faker::Lorem::paragraph(sentence_count: 5), name: Faker::Company.name)
        puts user.id
        company.users << user
        company.save!

        15.times do
            country = Faker::Address.country_by_code
            randomized = []
            BENEFITS.each do |element|
                random_boolean = [true, false].sample
                randomized << element if random_boolean
            end
            j_q = []
            JQ.each do |element|
                random_boolean = [true, false, false].sample
                if random_boolean || ["javascript", "SQL", "OOP"].include?(element)
                    j_q << element
                end
            end
            startSalary = rand(65000..130000)
            endSalary = startSalary + rand(10000..40000)

            JobsPublished.create(
                user_id: user.id,
                company_id: company.id,
                title: PROFESSIONS.sample,
                city: Faker::Address.city,
                state: Faker::Address.state,
                country: country,
                location_query: Faker::Address.full_address,
                current_job_type: JOB_TYPE.sample,
                remote: Faker::Boolean.boolean(true_ratio: 0.7),
                hire_in_country: country,
                experience: EXPERIENCE.sample,
                description: Faker::Lorem::paragraph(sentence_count: 10),
                benefits: randomized,
                salary_range: [startSalary, endSalary],
                status: "Active",
                job_q: j_q
            )
        end


    end



end