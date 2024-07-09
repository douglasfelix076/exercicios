clear

nStartTime := seconds()
while .t.
   clear
   @ 00,00 say 'tempo: ' + str(seconds() - nStartTime)
   inkey(0.5)
end
