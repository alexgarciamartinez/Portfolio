for $x in doc("parc.xml")/parc/atraccions/zona/atraccio
where $x/intensitat = 'Forta' and $x/edatMinima[@adult='no'] > 12
return concat('Nombre atraccion: ', $x/@nom, '')

