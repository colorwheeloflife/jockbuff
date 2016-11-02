class DraftResults
  include Sidekiq::Worker
    def get_draft
      @current_user = current_user
      @leagues = League.where(user_id: @current_user.id)
      @leagues.each do |league|
        draft_full = HTTParty.get("#{@yahoo_root}league/#{league[:league_key]}/draftresults", headers:{
        "Authorization" => "Bearer #{@current_user.token}"
        })
        draft_full

