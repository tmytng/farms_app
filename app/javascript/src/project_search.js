$(function() {
    $(".search-input").on("keyup", function() {
        let input = $(".search-input").val();
        $.ajax({
                type: 'GET',
                url: '/projects/search',
                data: { keyword: input },
                dataType: 'json'
            })
            .done(function(projects) {
                $(".index_field").empty();
                if (projects.length !== 0) {
                    projects.forEach(function(project) {
                        appendTweet(project);
                    });
                } else {
                    appendErrMsgToHTML("一致するプロジェクトがありません");
                }
            })
            .fail(function() {
                alert('error');
            });
    });
});