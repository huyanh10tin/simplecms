class PagesController < ApplicationController
  layout 'admin'
  before_action :confirm_logged_in

  before_action :find_subject
  before_action :find_subjects,:only => [:new,:create,:edit]
  before_action :set_page_count,:only => [:new,:create,:edit,:update]
  
  def new
    @page = Page.new(:subject_id => @subject.id)
    @page_count = Page.count + 1
    
  end
  def index
    @pages = @subject.pages.sorted
   
  end
  
  def create
    @page = Page.new(page_params)
    if @page.save
      flash[:notice] = "Page created successfully"
      redirect_to pages_path(:subject_id => @subject.id) 
    else
      @page_count = Page.count + 1
     
      render('new')
    end
  end

  def edit
    @page = Page.find(params[:id])
    
    
  end
  def update
    @page = Page.find(params[:id])
    
    if(@page.update_attributes(page_params))
      flash[:notice] = "Page edited successfully"
      redirect_to(page_path(@page,:subject_id => @subject.id))
    else
      render('edit')
    end
  end
  def delete
    @page = Page.find(params[:id])
  end
  def destroy
    @page = Page.find(params[:id])
    @page.destroy
    flash[:notice] = "Pages '#{@page.name}' deleted successfully"
    redirect_to(pages_path(:subject_id => @subject.id))
  end
  def show
    @page = Page.find(params[:id])
    # @name_subject = Subject.find(@page.subject_id).name
  end

  private
  def set_page_count
    @page_count = @subject.pages.count
    if params[:action] == 'new' || params[:action] == 'create'
      @page_count+= 1
    end  
  end
  def find_subject
   
    @subject = Subject.find(params[:subject_id])
    
  end
  def find_subjects
    @subjects = Subject.sorted
  end
  def page_params
    params.require(:page).permit(:subject_id,:name,:permalink,:position,:visible)
  end
end
