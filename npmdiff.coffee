fs = require 'fs'

if process.argv.length isnt 4
  console.log "Usage: coffee npmdiff.coffee <source_file> <target_file>"
  process.exit 1

list1 = fs.readFileSync process.argv[2], encoding: 'utf8'
list2 = fs.readFileSync process.argv[3], encoding: 'utf8'

getPacks = (list) ->
  packs = list.match /[\w\-]+@[\d\.]+/g
  uniq = []
  for pack in packs
    uniq.push pack if uniq.indexOf(pack) is -1
  uniq.sort()

packs1 = getPacks list1
packs2 = getPacks list2

diff1 = (pack for pack in packs2 when packs1.indexOf(pack) is -1)
diff2 = (pack for pack in packs1 when packs2.indexOf(pack) is -1)

for pack in diff1
  m = pack.match /^[\w\-]+/
  str = "#{m[0]}: +#{pack}"
  for pack2 in diff2
    if pack2.indexOf(m[0]) is 0
      str += " -#{pack2}"
  console.log str

