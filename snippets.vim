augroup abbreviations
    autocmd!
    " Bash
    autocmd FileType sh
        \ iabbrev <buffer> bash #!/bin/bash<CR>|
        \ iabbrev <buffer> ifs if [ ]; then<CR>:<CR>fi|
        \ iabbrev <buffer> ifm if [[ ]]; then<CR>:<CR>fi|
        \ iabbrev <buffer> forl for _ in *; do<CR>_;<CR>done|

    " Python
    autocmd FileType python
        \ iabbrev <buffer> dcs """"<CR>Docstring<CR>""""|
        \ iabbrev <buffer> df def foo():<CR>return|
        \ iabbrev <buffer> clss class MyClass:<CR>def __init__(self):<CR>pass|
        \ iabbrev <buffer> ifn if __name__ == '__main__':<CR>pass|
        \ iabbrev <buffer> trex try:<CR>pass<CR>except:<CR>pass|

    " Django
    autocmd FileType htmldjango
        \ iabbrev <buffer> extends {% extends '' %}
        \<CR><CR>{% block title %}{% endblock %}
        \<CR><CR>{% block content %}
        \<CR>{% endblock %}<LEFT>|
        \ iabbrev <buffer> block {% block %}{% endblock %}|
        \ iabbrev <buffer> if {% if %}<CR>{% endif %}<UP>|
        \ iabbrev <buffer> for {% for %}<CR>{% endfor %}<UP>|
        \ iabbrev <buffer> with {% with %}<CR>{% endwith %}<UP>|
        \ iabbrev <buffer> include {% include '' %}|
        \ iabbrev <buffer> load {% load %}|
        \ iabbrev <buffer> urld {% url '' %}|
        \ iabbrev <buffer> dtag {% %}|
        \ iabbrev <buffer> mlcom {% comment %}<CR>{% endcomment %}|
        \ iabbrev <buffer> slcom {# #}<BACKSPACE>|
        \ iabbrev <buffer> csrf {% csrf_token %}|
        \ iabbrev <buffer> formp {{ form.as_p }}|

    " Flask
    autocmd FileType htmldjango
        \ iabbrev <buffer> witm {% with messages = get_flashed_messages() %}
        \<CR><SPACE><SPACE>{% if messages %}
        \<CR><SPACE><SPACE>{% for message in messages %}
        \<CR><SPACE><SPACE>{{ message }}
        \<CR><BACKSPACE>{% endfor %}
        \<CR><BACKSPACE>{% endif %}
        \<CR><BACKSPACE>{% endwith %}

    " Vue JS
    autocmd FileType vue,javascript
        \ iabbrev <buffer> vtemp <template><CR></template><CR><CR><BACKSPACE>
        \<script><CR><BACKSPACE>export default {<CR>}<CR></script>
        \<CR><CR><BACKSPACE><style><CR><CR><BACKSPACE></style>|
        \ iabbrev <buffer> vexp export default {<CR><TAB>name: '',
        \<CR>data() {<CR><TAB>return {<CR>}<CR>},<CR>}|
        \ iabbrev <buffer> vdata data() {
        \<CR><TAB>return {
        \<CR>}<CR>},<LEFT><LEFT><BACKSPACE><SPACE>|
        \ iabbrev <buffer> vsetup setup() {<CR>
        \<SPACE><SPACE>return {<SPACE>}<CR>}|
        \ iabbrev <buffer> vcomp components: {<CR>},|
        \ iabbrev <buffer> vcompu computed: {
        \<CR><TAB>fnName() {
        \<CR><TAB>return<CR>}<CR>},<LEFT><LEFT><BACKSPACE><SPACE>|
        \ iabbrev <buffer> vmet methods: {
        \<CR><TAB>fnName() {
        \<CR><TAB>return<CR>}<CR>},<LEFT><LEFT><BACKSPACE><SPACE>|
        \ iabbrev <buffer> vcreat created() {<CR>},|
        \ iabbrev <buffer> vwatd watch: {
        \<CR><TAB>data: {<CR><TAB>imeddiate: true,
        \<CR><TAB>deep: true,<CR>handler(newValue, oldValue) {<CR>}<CR>}<CR>},|
        \ iabbrev <buffer> vfil filters: {
        \<CR><TAB>fnName: function(value) {<CR><TAB>return value;<CR>}<CR>},|
        \ iabbrev <buffer> vprop props: {<CR><TAB>propName: {
        \<CR><TAB>type: ,<CR><TAB>default: ,<CR><TAB>required:<CR>},<CR>},|
        \ iabbrev <buffer> tryc try {<CR>} catch (err) {<CR>}|
        \ iabbrev <buffer> conl console.log()|
augroup END
