class PositiveVotesController < ApplicationController



  def create
    @positive_vote = PositiveVote.new params[:positive_vote]
    site = params[:positive_vote][:site_id]
    ip = params[:positive_vote][:ip_address]
    @lastvote = PositiveVote.last(:conditions => ["site_id = ? AND ip_address = ?", site, ip])
    last_vote_time = @lastvote.created_at unless @lastvote.blank?
    current_time = Time.now

    if ((@lastvote && current_time - last_vote_time >= 12.hours) || @lastvote.blank?)
      if @positive_vote.save
        redirect_to :back
      else
        redirect_to root_path
      end

    else
      flash[:error] = "You can only vote for one item every 12 hours"
      redirect_to :back

    end
  end
  end

