$(function() {

    let search_list = $(".card-columns");

    function appendProject(project) {

        let html = `
      <div class="card" style="width: 20rem">
      <div class="card-body">
      <h5 class="card-title">
      ${project.name}
      </h5>
      <div class="card-text">
        <ul class="pj-members">
          <% project.users.each do |member| %>
            <li class="member-icons">
              <% if member.avatar.attached? %>
          <%= link_to user_path(member) do %>
            <%= image_tag member.avatar %>
          <% end %>
          <% end %>
            </li>
          <% end %>
        </ul>
      </div>
      <div class="card-text">
      ${project.profile}
      </div>
      </div>
      <ul class="list-group list-group-flush">
      <li class="list-group-item">
      作成者：${project.creator}
      </li>
      <li class="list-group-item">
      作成日：{l project.created_at, format: :short}
      </li>
      <li class="list-group-item">
      更新：2020/11/24
      </li>
      <li class="list-group-item">
      メンバー：{project.users.count}人
      </li>
      <%= link_to "Go somewhere", root_path, class:"btn btn-primary" %>
      </ul>
      </div>
`
        search_list.append(html);
    }

    function appendErrMsgToHTML(msg) {
        let html = `<card class="card">${ msg }</div>`
        search_list.append(html);
    }

    $(".search-input").on("keyup", function() {
        let input = $(".search-input").val();
        $.ajax({
                type: 'GET',
                url: '/projects/search',
                data: { keyword: input },
                dataType: 'script'
            })
            .done(function(projects) {
                search_list.empty();
                if (projects.length !== 0) {
                    projects.forEach(function(project) {
                        appendProject(project);
                    });
                } else {
                    appendErrMsgToHTML("該当のプロジェクトはありません");
                }
            })
    });
});