class SitesController < ApplicationController
  before_filter :authenticate_user!, :except => [:index, :show]
  load_and_authorize_resource :only => [:edit, :update, :destroy]

  def index
    @page_title = "An Up-to-Date List of Article Submission Sites"

    @sites = Site.paginate  :page => params[:sites_page],
                            :per_page => 10,
                            :order => "positive_votes_count DESC"
    @positive_vote = PositiveVote.new params[:positive_vote]
    @negative_vote = NegativeVote.new params[:negative_vote]
  end

  def new
    @page_title = "Submit a new article submission site"
    @site = Site.new
  end

  def create
    @site = current_user.sites.build params[:site]
    if @site.save
      flash[:notice] = "Site successfully submitted"
      redirect_to root_path
    else
      render :action => 'new'
    end
  end

  def show
    @site = Site.find params[:id]
    @comment = Comment.new params[:comment]
    @comments = @site.comments.paginate  :page => params[:page],
                                  :per_page => 10,
                                  :order => "created_at DESC"
    @positive_vote = PositiveVote.new params[:positive_vote]
    @negative_vote = NegativeVote.new params[:negative_vote]
  end

  def edit
    @page_title = "Edit site"
    @site = Site.find params[:id]

  end

  def update
    @site = Site.find params[:id]
    @site.update_attributes params[:site]
    if @site.save
      redirect_to current_user
    else
      render :action => 'edit'
    end

  end

  def destroy
    @site = Site.find params[:id]
    @site.destroy
    flash[:notice] = "Site has been deleted"
    redirect_to root_path
  end

end
