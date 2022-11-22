class TestWorker
    include Sidekiq::Worker
    sidekiq_options retry: false
    
    def perform(first_param)
        puts "SIDEKIQ RUNNING #{first_param}"
    end
#TestWorker.perform_async("test")
end