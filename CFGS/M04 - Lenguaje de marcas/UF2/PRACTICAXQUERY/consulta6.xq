for $x in doc ("parc.xml")//parc/dates/dataTancament
return replace value of node $x/. with '10/02/2021'
