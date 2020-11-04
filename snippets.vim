" Bash
autocmd FileType sh
    \ iabbrev <buffer> bash #!/bin/bash<CR><BACKSPACE>|
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
    \ iabbrev <buffer> for {% for %}<CR>{% endfor %}<UP>|
    \ iabbrev <buffer> if {% if %}<CR>{% endif %}<UP>|
    \ iabbrev <buffer> include {% include '' %}|
    \ iabbrev <buffer> load {% load %}|

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
autocmd FileType vue
    \ iabbrev <buffer> vdata data() {
      \<CR><TAB>return {
      \<CR>}<CR>},<LEFT><LEFT><BACKSPACE><SPACE>|
    \ iabbrev <buffer> vcomp computed: {
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
      \<CR><TAB>type: ,<CR><TAB>default:<CR>},<CR>},|

