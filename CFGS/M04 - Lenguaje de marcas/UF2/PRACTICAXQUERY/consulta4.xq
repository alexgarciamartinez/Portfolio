for $x in doc ("parc.xml") //passi
where $x/horaInici = '12:30'
return concat('Total passis que comencen a les 16:00:',' ',count($x/../../@nom))
