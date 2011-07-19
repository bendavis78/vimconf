func! MyPythonFunction() range
python << endpython
print "TEST 2"
import vim
r = vim.current.range
print [l for l in r]
for i, l in enumerate(r):
    r[i] = l.replace(' ','-')
endpython
endfunc

command! -range=% DoPythonFunction call MyPythonFunction()
