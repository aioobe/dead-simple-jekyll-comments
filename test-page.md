---
layout: home
---

Testing comments, 1, 2, testing...

<style>
.article-comment {
    display: flex;
    clear: both;
    padding-top: .7em;
}

.article-comment-content {
    flex-grow: 1;
}

.article-comment .article-comment, .article-comment ~ .article-comment {
    border-top: .1em solid #eee;
}

.article-comment summary {
    color: #2a7ae2;
    cursor: pointer;
}

.article-comment-avatar {
    width: 3.5em;
    max-width: 20%;
    margin-right: .7em;
}

.article-comment-footer {
    font-size: smaller;
    color: grey;
    display: inline;
    float: left;
    padding: .7em 0em;
}

input, select, textarea {
    margin-bottom: .5em;
    background: #eee;
    border: none;
    padding: .5em;
    width: 100%;
}

textarea {
    height: 10em;
}

input[type='submit'] {
    width: auto;
}

label {
    font-size: smaller;
    color: grey;
    display: block;
}

</style>

Comments
--------
{% include comments.html replies_to=page.url %}
{% include comment-form.html reply_to=page.url %}
