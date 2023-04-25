#ENTREGABLE de Alex García 1rDAM B Matí
#1
SELECT p.nom_popular FROM planta p, exemplar_planta ep WHERE p.nom_cientific = ep.nom_planta AND ep.num_exemplar = (SELECT COUNT(ep.num_exemplar) FROM exemplar_planta ep WHERE ep.num_exemplar = 1);
#2
SELECT p.nom_popular FROM planta p, exemplar_planta ep WHERE p.nom_cientific = ep.nom_planta AND ep.num_exemplar NOT IN (SELECT ep.num_exemplar FROM exemplar_planta ep WHERE ep.num_exemplar >= 1);
#3
SELECT da.nom_estacio, COUNT(da.quantitat_adob) FROM dosi_adob da GROUP BY da.nom_estacio;
#4
SELECT p.nom_popular FROM planta p, dosi_adob da WHERE p.nom_cientific = da.nom_planta AND da.nom_planta NOT IN (SELECT DISTINCT da.nom_planta FROM dosi_adob da WHERE da.nom_estacio = 'Primavera');
#5
SELECT COUNT(r.metode_reproduccio) FROM reproduccio r GROUP BY r.nom_planta;
#6
SELECT r.nom_planta, COUNT(r.metode_reproduccio) FROM reproduccio r WHERE r.grau_exit = 'Alt' GROUP BY r.nom_planta;
#7
SELECT DISTINCT r.nom_planta FROM reproduccio r WHERE r.metode_reproduccio NOT IN (SELECT r.metode_reproduccio FROM reproduccio r WHERE r.metode_reproduccio = 'Esqueix');
#8
SELECT pi.nom_planta FROM planta p, planta_interior pi WHERE p.nom_cientific = pi.nom_planta AND p.floracio = 'Primavera';
#9
SELECT COUNT(a.nom_adob) FROM adob a GROUP BY a.nom_firma;