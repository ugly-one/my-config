set number
set relativenumber

" below are to make sure I don't use arrow keys and get used to hjkl 
nnoremap <Left> :echo "No left for you!"<CR>
vnoremap <Left> :<C-u>echo "No left for you!"<CR>
inoremap <Left> <C-o>:echo "No left for you!"<CR>

nnoremap <Right> :echo "No right for you!"<CR>
vnoremap <Right> :<C-u>echo "No right for you!"<CR>
inoremap <Right> <C-o>:echo "No right for you!"<CR>

nnoremap <Up> :echo "No up for you!"<CR>
vnoremap <Up> :<C-u>echo "No up for you!"<CR>
inoremap <Up> <C-o>:echo "No up for you!"<CR>

nnoremap <Down> :echo "No down for you!"<CR>
vnoremap <Down> :<C-u>echo "No down for you!"<CR>
inoremap <Down> <C-o>:echo "No down for you!"<CR>

" make the directory listing (tree) look nicer
let g:netrw_banner = 0 " disable banner
let g:netrw_liststyle = 3
let g:netrw_altv=1

" C# stuff
let g:OmniSharp_server_use_net6 = 1
call plug#begin()
Plug 'OmniSharp/omnisharp-vim'
Plug 'ThePrimeagen/vim-be-good'
call plug#end()
