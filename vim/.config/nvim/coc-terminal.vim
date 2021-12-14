command -nargs=1 Mycd call MyCd(<args>)
function MyCd(path)
  cd a:path
  e somefile.ext
endfunction
