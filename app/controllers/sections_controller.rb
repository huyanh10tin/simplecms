class SectionsController < ApplicationController
  layout 'admin'
  def new
    @section = Section.new()
    @section_count = Section.count + 1
    @pages = Page.all
  end

  def index
    @sections = Section.sorted
   
  end
  
  def edit
    @section = Section.find(params[:id])
    @section_count = Section.count
    @pages = Page.all
  end
  def create
    @section = Section.new(section_params)
    if @section.save
      flash[:notice] = "Section created successfully."
      redirect_to(sections_path)
    else
      @section_count = Section.count + 1
      @pages = Page.all
      render('new')
    end
  end
  def update
    @section = Section.find(params[:id])
    
    if(@section.update_attributes(section_params))
      flash[:notice] = "Section edited successfully"
      redirect_to(section_path(params[:id]))
    else
      @section_count = Section.count
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
    redirect_to(sections_path)

  end

  def show
    @section = Section.find(params[:id])
    # @page_name = Page.find(@section.page_id).name
  end
  private
  def section_params
    params.require(:section).permit(:page_id,:name,:position,:visible,:content_type,:content)
  end
end
