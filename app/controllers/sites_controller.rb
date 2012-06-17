class SitesController < ApplicationController
  def index
    @sites = Site.all(:order => "positive_votes DESC")
    @positive_vote = PositiveVote.new params[:positive_vote]
    @negative_vote = NegativeVote.new params[:negative_vote]

  end

  def new
    @site = Site.new
  end

  def create
    @site = current_user.sites.build params{:site}
  end

  def edit
    @site = Site.find paramss[:id]

  end

  def update
    @site = Site.find params[:id]

  end

  def destroy
    @site = Site.find params[:id]

  end
end
