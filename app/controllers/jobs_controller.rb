class JobsController < ApplicationController

  def index
    @jobs = Job.all
  end
  
  def show
    @job = Job.find(params[:id])
    if @job.nil?
      head :not_found
    end
  end

  def new
    @job = Job.new
  end

  def create
    @job = Job.new(
      title: params[:job][:title],
      description: params[:job][:description],
      company: params[:job][:company]
    )
    if @job.save
      redirect_to jobs_path
    else
      render :new, :bad_request
    end
  end

  def edit
    @job = Job.find(params[:id])
  end

  def update
    # find that job that we want to update
    @job = Job.find(params[:id])
    # update the job
    if @job.update(
      title: params[:job][:title],
      description: params[:job][:description],
      company: params[:job][:company]
    )
    # redirect if job is successfully update
      redirect_to job_path(@job.id)
    else
      # if not stay in the edit form
      render :edit, :bad_request
    end
  end

  def delete
  end

end
