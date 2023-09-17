for $x in doc ("parc.xml") //botigues/zona/botiga
for $y in doc ("parc.xml") //botigues/zona/botiga
where $x/producte = $y/producte and $x/../@nom != $y/../@nom
return concat($x/./@nom, 'vende lo mismo que ', $y/./@nom)