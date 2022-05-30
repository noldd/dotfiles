setlocal tabstop=4
setlocal shiftwidth=4
setlocal noexpandtab

" Tags
nmap <leader>gtj :CocCommand go.tags.add json<cr>
nmap <leader>gty :CocCommand go.tags.add yaml<cr>
nmap <leader>gtx :CocCommand go.tags.clear<cr>

" Tests
nmap <leader>tt :CocCommand go.test.toggle<cr>
nmap <leader>tf :CocCommand go.test.generate.function<cr>
nmap <leader>ta :CocCommand go.test.generate.file<cr>
