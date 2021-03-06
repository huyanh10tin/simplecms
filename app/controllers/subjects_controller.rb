class SubjectsController < ApplicationController
  layout 'admin'
  before_action :confirm_logged_in
  
  def index
    logger.debug("**** Testing the logger. ****")
    @subjects = Subject.sorted
    
  end

  def show
    @subject = Subject.find(params[:id])
  end

  def new
    @subject = Subject.new()
    @subject_count = Subject.count + 1
  end

  def create
    @subject = Subject.new(subject_params)
    if @subject.save
      flash[:notice] = "Subject created successfully"
      redirect_to(subjects_path)
    else
      @subject_count = Subject.count + 1
      render('new')
    end
  end

  def edit
    @subject = Subject.find(params[:id])
    @subject_count = Subject.count
  end
  def update
    @subject = Subject.find(params[:id])
    
    if(@subject.update_attributes(subject_params))
      flash[:notice] = "Subject edited successfully"
      redirect_to(subject_path(params[:id]))
    else
      @subject_count = Subject.count
      render('edit')
    end
  end
  def delete
    @subject = Subject.find(params[:id])
  end
  def destroy
    @subject = Subject.find(params[:id])
    @subject.destroy
    flash[:notice] = "Subject '#{@subject.name}' deleted successfully"
    redirect_to(subjects_path)
  end
  private

  def subject_params
    params.require(:subject).permit(:name,:position,:visible,:created_at)
  end
end
