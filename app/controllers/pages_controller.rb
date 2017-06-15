class PagesController < ApplicationController
  layout 'admin'
  def new
    @page = Page.new()
    @page_count = Page.count + 1
    @subjects = Subject.all

  end
  def index
    @pages = Page.sorted
   
  end
  
  def create
    @page = Page.new(page_params)
    if @page.save
      flash[:notice] = "Page created successfully"
      redirect_to pages_path 
    else
      @page_count = Page.count + 1
      @subjects = Subject.all
      render('new')
    end
  end

  def edit
    @page = Page.find(params[:id])
    @page_count = Page.count
    @subjects = Subject.all
  end
  def update
    @page = Page.find(params[:id])
    
    if(@page.update_attributes(page_params))
      flash[:notice] = "Page edited successfully"
      redirect_to(page_path(params[:id]))
    else
      @page_count = Page.count
      @subjects = Subject.all
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
    redirect_to(pages_path)
  end
  def show
    @page = Page.find(params[:id])
    # @name_subject = Subject.find(@page.subject_id).name
  end

  private

  def page_params
    params.require(:page).permit(:subject_id,:name,:permalink,:position,:visible)
  end
end
