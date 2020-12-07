import Vue from 'vue'
import axios from 'axios'
axios.defaults.headers.common = {
    'X-Requested-With': 'XMLHttpRequest',
    'X-CSRF-TOKEN' : document.querySelector('meta[name="csrf-token"]').getAttribute('content')
};
new Vue({
    el: '#pjnew',
    data: {
        body: '',
        name: document.querySelector("[v-model='name']").value,
        article_id: document.querySelector("[v-model='article_id']").value
    },
    methods: {
        comment_create: function() {
            axios
                .post('http://0.0.0.0:3000/api/v1/comments.json', {
                    comment: {
                        body: this.body,
                        username: this.username,
                        article_id: this.article_id
                    }
                })
                .then(response => (this.info = response))
        }
    }
})
