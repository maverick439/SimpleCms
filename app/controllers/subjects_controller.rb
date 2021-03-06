class SubjectsController < ApplicationController
  layout "admin"

  def index 
    @subjects = Subject.all
  end

  def show
    @subject = Subject.find(params[:id])
  end

  def new
    @subject = Subject.new
  end

  def create
    @subject = Subject.new(params.require(:subject).permit(:name, :position, :visiible))

    if @subject.save
      flash[:notice] = "Subject created successfully."
      redirect_to(:action => 'index')
    else
      render('new')
    end
  end

  def edit
    @subject = Subject.find(params[:id])
  end

  def update
    @subject = Subject.find(params[:id])
    if @subject.update_attributes(subject_params)
      flash[:notice] = "Subject updated successfully."
      redirect_to(:action => 'show', :id => @subject.id)
    else
      render('edit')
    end
  end

  def delete
    @subject = Subject.find(params[:id])
  end

  def destroy
    subject = Subject.find(params[:id])
    subject.destroy
    flash[:notice] = "Subject '#{subject.name}'destroyed successfully."
    redirect_to(:action => 'index')
  end
  def subject_params
    params.require(:subject).permit(:name, :position, :visiible)
  end

end
