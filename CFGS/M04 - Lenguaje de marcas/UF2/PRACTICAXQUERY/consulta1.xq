for $x in doc("parc.xml")/parc/atraccions/zona/atraccio
where $x/edatMinima[@adult='no'] <= 10
return concat('Nombre atraccion: ', $x/@nom, '')

