class SectionsController < ApplicationController
  layout 'admin'
  before_action :confirm_logged_in
  before_action :find_page
  before_action :set_section_count
  def new
    @section = Section.new(:page_id => @page.id)
    
    @pages = Page.all
  end

  def index
    @sections = @page.sections.sorted
    
  end
  
  def edit
    @section = Section.find(params[:id])
    
    @pages = Page.all
  end
  def create
    @section = Section.new(section_params)
    if @section.save
      flash[:notice] = "Section created successfully."
      redirect_to(sections_path(:page_id => @page.id))
    else
      
      @pages = Page.all
      render('new')
    end
  end
  def update
    @section = Section.find(params[:id])
    
    if(@section.update_attributes(section_params))
      flash[:notice] = "Section edited successfully"
      redirect_to(section_path(@section,:page_id => @page.id))
    else
      
      @pages = Page.all
      render('edit')
    end
  end

  def delete
    @section = Section.find(params[:id])
  end

  def destroy
    @section = Section.find(params[:id])
    @section.destroy
    flash[:notice] = "Section '#{@section.name}' deleted successfully"
    redirect_to(sections_path(:page_id => @page.id))

  end

  def show
    @section = Section.find(params[:id])
    # @page_name = Page.find(@section.page_id).name
  end
  private
  def set_section_count
    @section_count = @page.sections.count
    if params[:action] = 'new' || params[:action] == 'create'
      @section_count += 1
    end
  end
  def find_page
    @page = Page.find(params[:page_id])
  end
  def section_params
    params.require(:section).permit(:page_id,:name,:position,:visible,:content_type,:content)
  end
end
