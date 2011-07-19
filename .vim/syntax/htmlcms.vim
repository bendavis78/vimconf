if !exists("main_syntax")
  let main_syntax = 'htmldjango'
endif

runtime! syntax/htmldjango.vim
unlet b:current_syntax

syn keyword djangoStatement contained cmsblock endcmsblock page_js page_css page_title page_meta nav

let b:current_syntax = "htmlcms"
