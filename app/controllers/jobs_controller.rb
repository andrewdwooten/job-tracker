class JobsController < ApplicationController
  def index
    @company = Company.find(params[:company_id])
    @jobs = @company.jobs
  end

  def new
    @company = Company.find(params[:company_id])
    @job = Job.new()
  end

  def create
    @company = Company.find(params[:company_id])
    @job = @company.jobs.new(job_params)
    if @job.save
      flash[:success] = "You created #{@job.title} at #{@company.name}"
      redirect_to company_job_path(@company, @job)
    else
      redirect_to new_company_job_path(@company)
    end
  end

  def show
    @job = Job.find(params[:id])
    @comment = Comment.new
    @comment.job_id = @job.id
  end

  def edit
    @job = Job.find(params[:id])
    @company = @job.company
  end

  def update
    @job = Job.find(params[:id])
    @company = @job.company
    @job.update_attributes(job_params)
    if @job.save
      flash[:success] = "You updated #{@job.title} position at #{@company.name}"
      redirect_to company_job_path(@company, @job)
    else
      redirect_to edit_company_job_path(@company, @job)
    end
  end

  def destroy
    job = Job.find(params[:id])
    company = job.company
    job.destroy
    redirect_to company_jobs_path(company)
  end

  private

  def job_params
    params.require(:job).permit(:title, :description, :level_of_interest, :city, :category_id)
  end
end
