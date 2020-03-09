class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:lewagon]

  def home
    @jobs = Job.all
  end
  
  def lewagon
    @jobs = Job.all
  	@job_cities = []
  	Job.all.each do |job|
  		@job_cities << job.location
  	end
  	@job_cities = @job_cities.uniq

  	@job_categories = []
  	Job.all.each do |job|
  		@job_categories << job.category
  	end
  	@job_categories = @job_categories.uniq
  end

  def dashboard
    @jobs = Job.all
    @applications = current_user.applications
  end
end
