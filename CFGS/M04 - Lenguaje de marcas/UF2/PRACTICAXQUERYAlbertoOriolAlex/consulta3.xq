let $contador := count(doc("parc.xml")/parc/espectacles/zona/espectacle/horari/passi[horaInici="12:30"]
)
return concat('Total de passis que començan a les 12:30: ', ' ',$contador)





