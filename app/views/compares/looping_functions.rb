<<<<<<< HEAD views/compares/_team_stat_impact
    <h1>Full Other Team Stats</h1>
      <table class="table table-bordered table-striped table-hover table-responsive table-players">
        <thead>
          <tr>
            <% PlayerCategory.find_by(league_id: params[:league_id]).attributes.each do |stat| %>
            <% next unless stat[1] == true %>
            <th data-field="<%=stat[0]%>">
            <% stat[0] = "+/-" if stat[0] == "plusminus" %>
            <% stat[0] = "SH%" if stat[0] == "shpercent" %>
            <%= stat[0].upcase %> </th>
            <% end %>
            <th data-field="jbr">JBR</th>
          </tr>
        </thead>
        <tbody id="other-total-team-stats">
          <tr>
          <% PlayerCategory.find_by(league_id: params[:league_id]).attributes.each do |stat| %>
            <% next unless stat[1] == true %>
            <td id="other-total-team-<%=stat[0]%>" class = "other-total-<%=stat[0]%>"></td>
            <% end %>
            <td class="user-total-jbr"></td>
          </tr>
          </tbody>
        </table>

      <table class="table table-bordered table-striped table-hover table-responsive table-players">
        <thead>
          <tr>
            <% GoalieCategory.find_by(league_id: params[:league_id]).attributes.each do |stat| %>
            <% next unless stat[1] == true %>
            <th data-field = "<%=stat[0]%>"> <% stat[0] = "SV%" if stat[0] == "svpercent" %>
            <%= stat[0].upcase %> </th>
            <% end %>
            <th data-field="jbr">JBR</th>
          </tr>
        </thead>
        <tbody>
          <tr>
            <% GoalieCategory.find_by(league_id: params[:league_id]).attributes.each do |stat| %>
            <% next unless stat[1] == true %>
            <td id="other-total-team-<%=stat[0]%>" class = "other-total-<%=stat[0]%>"></td>
            <% end %>
            <td class="user-total-jbr"></td>
          </tr>
        </tbody>
      </table>
    </div>


# views/compares/_user_team
<<<<<<< HEAD
  <%= render partial: "fixed_header_columns", locals: {tableType: "userTable", playerType: "Player" } %>
      <% PlayerCategory.find_by(league_id: params[:league_id]).attributes.each do |stat| %>
      <% next unless stat[1] == true %>
      <th class = "hidden" data-field="<%=stat[0]%>" data-sortable="true">
      <% stat[0] = "+/-" if stat[0] == "plusminus" %>
      <% stat[0] = "SH%" if stat[0] == "shpercent" %>
      <%= stat[0].upcase %> </th>
      <% end %>
        </tr>
=======
      </thead>
  <tbody id="each-user-player">
    <% @current_user_players.each do |player_passport| %>
    <% next if player_passport.player.positions.join(" / ").include?("G") %>
      <tr>
        <td></td>
        <td class="user-team-players"> <%= player_passport.player.name %> </td>
        <td class="user-team-players"> <%= player_passport.player.pro_team.upcase %></td>
        <td class="user-team-players"> <%= player_passport.player.positions.join("/") %> </td>
        <td class="user-team-players jbr-stat"> <%= jbr_by_cat(1, player_passport.player.player_id, :jbr)[player_passport.player.player_id] %> </td>
<<<<<<< HEAD
        <% PlayerCategory.find_by(league_id: params[:league_id]).attributes.each do |stat| %>
        <% next unless stat[1] == true %>
        <td class = "hidden user-team-players <%=stat[0]%>"> <%= player_passport.player.player_prediction.send(stat[0]) %> </td>
        <% end %>
        </tr>
        <% end %>
    </tbody>
  </table>
     <%= render partial: "fixed_header_columns", locals: { tableType: "userGoalieTable", playerType: "Goalie" } %>
     <% GoalieCategory.find_by(league_id: params[:league_id]).attributes.each do |stat| %>
        <% next unless stat[1] == true %>
        <th class = "hidden" data-field = "<%=stat[0]%>"" data-sortable="true"> <% stat[0] = "SV%" if stat[0] == "svpercent" %>
        <%= stat[0].upcase %> </th>
        <% end %>
        </tr>
    </thead>
      <tbody>
          <% @current_user_players.each do |player_passport| %>
          <% next if player_passport.player.positions.join("/").exclude?("G") %>
        <tr>
          <td></td>
          <td class="user-team-goalies"><%= player_passport.player.name %></td>
          <td class="user-team-goalies"><%= player_passport.player.pro_team.upcase %></td>
          <td class="user-team-goalies"><%= player_passport.player.player_prediction.gs %></td>
          <td class="user-team-goalies"><%= jbr_by_cat(0, player_passport.player.player_id, :jbr)[player_passport.player.player_id] %> </td>
          <% GoalieCategory.find_by(league_id: params[:league_id]).attributes.each do |stat| %>
          <% next unless stat[1] == true %>
          <td class = "hidden user-team-goalies #{stat[0]}"> <%= player_passport.player.player_prediction.send(stat[0]) %> </td>
          <% end %>
=======
