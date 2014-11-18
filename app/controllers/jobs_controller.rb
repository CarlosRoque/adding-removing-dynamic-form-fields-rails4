class JobsController < ApplicationController
  before_filter :load_job , only: [:show,:edit,:update]
  helper :jobs

  def index
    @jobs = Job.all
  end
  def show
  end
  def new
    @job = Job.new
  end
  def edit
  end
  def create
    @job = Job.new(job_params)
    if(@job.save)
      redirect_to job_url(@job), notice: 'Job was successfully created'
    else
      render :new
    end
  end
  def update
    if(@job.update(job_params))
      redirect_to job_url(@job), notice: 'Job was successfully updated'
    else
      render :edit
    end
  end

  private
  def load_job
    @job = Job.find(params[:id])
  end
  def job_params
    params.require(:job).permit(:id,:title, :tasks_attributes => [:id, :name,:_destroy])
  end
end
