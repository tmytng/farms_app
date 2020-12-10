$(function() {

    let search_list = $(".pj-box");

    function appendProject(project) {

        let html =
            `<div class="pj-box">
              <h1>test</h1>
              <p>${project.name}</p>
              <p>${project.profile}</p>
            </div>`
        search_list.append(html);
    }

    function appendErrMsgToHTML(msg) {
        let html = `<div class='name'>${ msg }</div>`
        search_list.append(html);
    }

    $(".search-input").on("keyup", function() {
        let input = $(".search-input").val();
        $.ajax({
                type: 'GET',
                url: '/projects/search',
                data: { keyword: input },
                dataType: 'json'
            })
            .done(function(projects) {
                search_list.empty();
                if (projects.length !== 0) {
                    projects.forEach(function(project) {
                        appendProject(project);
                    });
                } else {
                    appendErrMsgToHTML("一致するツイートがありません");
                }
            })
    });
});