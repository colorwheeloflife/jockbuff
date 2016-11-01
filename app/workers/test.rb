require 'httparty'
require 'byebug'

  draft_full = HTTParty.get("https://fantasysports.yahooapis.com/fantasy/v2/league/363.l.91006/draftresults", headers:{
        "Authorization" => "Bearer fJlI.8abvwiUGRn79UEe1BEtUQCPkzh1dj9LQt_IwVgFSkSNd8FSL77WfP7l3s0psbmH3CV2y7InwS.KL.xaoZ3.UcUY0KDB78iQPS7GxEGG6nVP6zmV7kPG9.AemewwXbD5Dcd8ox8NAA0jgYhdQ8Si48ERaoFfTlSMFjovC.Z9E2iQkVwxWHGTt0LLYz851FRta9XQ2BuBtQSCq5oQvjpfqR_qRmmrSIY16ey9.RRz6UJvbm36TC6_3juOQPw4Jjovb0TbXOqYCUH1fCWvysdmpeVcu26rkV21bjY4sVAsIH4Z9iIx29PIxw1mvMyE7AivOEiSzQJyRlhOvUiMKmJUid_PFAQgiJ.smCtvD0l2lR3XDVNFFyqTaSms._Ow7wGXizMDFTrQX5kgrkrfLYWFT62J6AaOxcJq8jc3f4YcTgeJfSFQ5ySoQkAPFqhPmlERAusRzbLcQ_Asga8BnGKIgcPSa708m0bgV5t71vNWtlh3j.nJdYI4Ya8j1g7IGc.oSh1lRinpaW87LAtNgBR0SZ3aZ6xiMqATophc9fVwcumkLAreuCIHenmlnVy25Z3BAB6QM0Hu98biSgeBCSVRsOcrDu.ISmo3nlfOZ9vM9r.6KaaIUxMwwE5kxSqsEzfBSRVNa6F.sEvA3hhbjM4_UqyH4qa4zXhykO5v0NWmW97b9BFngq641YkztVBjPN.ae5wERY3UOBRaKIRNauEl2eS6idJeDb7i3F9lFFX2lsqBNiVYZ63gs9mOLLKc5rtnSSWVaO_hYw--"
        })
  draft_players = draft_full["fantasy_content"]["league"]["draft_results"]["draft_result"]
  update_passport = draft_players.map do |player|
    draft_info = [player["pick"], player["player_key"].split('p.')[1]]
  end

      ActiveRecord::Base.transaction do
        PlayerPassport.import(full_league_owned_players.flatten)
      end
