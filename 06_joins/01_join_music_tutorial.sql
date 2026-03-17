/**********************************************************************
|                                                                     |
|   TUTORIAL 6: JOIN - Music Database (SQLZoo)                       |
|                                                                     |
|   Bryan Vargas - Data Analyst in transition                         |
|   Fecha: Marzo 2026                                                 |
|                                                                     |
|   Tablas:                                                           |
|   album(asin, title, artist, price, release, label, rank)          |
|   track(album, dsk, posn, song)                                     |
|                                                                     |
|   Relación: album.asin = track.album (uno a muchos)                |
|   Un álbum tiene muchas canciones                                   |
|                                                                     |
**********************************************************************/

/*---------------------------------------------------------------------
|   DESCRIPCIÓN DE TABLAS                                            |
---------------------------------------------------------------------*/
/*
   TABLA album:
   asin    : Código identificador del álbum (clave primaria)
   title   : Título del álbum
   artist  : Artista o banda
   price   : Precio del álbum
   release : Fecha de lanzamiento
   label   : Discográfica
   rank    : Posición en ranking

   TABLA track:
   album   : Código asin del álbum (clave foránea → album.asin)
   dsk     : Número de disco (1, 2, etc. para álbumes múltiples)
   posn    : Posición de la canción en el disco
   song    : Título de la canción
*/

/*---------------------------------------------------------------------
|   EJEMPLO DE JOIN BÁSICO                                           |
---------------------------------------------------------------------*/
-- Cada fila del resultado representa una canción con los datos completos
-- de su álbum correspondiente. Los datos del álbum se repiten para cada canción.

SELECT *
FROM album
JOIN track ON album.asin = track.album
LIMIT 10;

/*---------------------------------------------------------------------
|   1. Encuentra el título y el artista que grabaron la canción 'Alison'
---------------------------------------------------------------------*/
SELECT title, artist
FROM album
JOIN track ON album.asin = track.album
WHERE song = 'Alison';

/*---------------------------------------------------------------------
|   2. ¿Qué artista grabó la canción 'Exodus'?                       |
---------------------------------------------------------------------*/
SELECT artist
FROM album
JOIN track ON album.asin = track.album
WHERE song = 'Exodus';

/*---------------------------------------------------------------------
|   3. Muestra las canciones del álbum 'Blur'                        |
---------------------------------------------------------------------*/
SELECT song
FROM album
JOIN track ON album.asin = track.album
WHERE title = 'Blur';

/*---------------------------------------------------------------------
|   4. Para cada álbum, muestra el título y el número total de canciones
---------------------------------------------------------------------*/
SELECT title, COUNT(song) AS total_tracks
FROM album
JOIN track ON album.asin = track.album
GROUP BY title
ORDER BY total_tracks DESC;

/*---------------------------------------------------------------------
|   5. Para cada álbum, muestra título y número de canciones con 
|      la palabra 'Heart' (solo álbumes con al menos una)
---------------------------------------------------------------------*/
SELECT title, COUNT(song) AS heart_tracks
FROM album
JOIN track ON album.asin = track.album
WHERE song LIKE '%Heart%'
GROUP BY title
ORDER BY heart_tracks DESC;

/*---------------------------------------------------------------------
|   6. "Title track" es cuando la canción tiene el mismo nombre que el álbum
---------------------------------------------------------------------*/
SELECT song AS title_track
FROM album
JOIN track ON album.asin = track.album
WHERE title = song;

/*---------------------------------------------------------------------
|   7. Álbum "epónimo" es cuando el título es igual al artista
|      (ej. 'Blur' de la banda 'Blur')
---------------------------------------------------------------------*/
SELECT DISTINCT title AS eponymous_album
FROM album
WHERE title = artist
ORDER BY title;

/*---------------------------------------------------------------------
|   8. Canciones que aparecen en más de 2 álbumes diferentes
|      Incluye un conteo del número de veces que aparece cada una
---------------------------------------------------------------------*/
SELECT song, COUNT(DISTINCT album.asin) AS times_recorded
FROM album
JOIN track ON album.asin = track.album
GROUP BY song
HAVING COUNT(DISTINCT album.asin) > 2
ORDER BY times_recorded DESC;

/*---------------------------------------------------------------------
|   9. Álbumes "buen valor": precio por canción < 0.50
|      Muestra título, precio y número de canciones
---------------------------------------------------------------------*/
SELECT title, 
       price, 
       COUNT(song) AS total_tracks,
       ROUND(price / COUNT(song), 2) AS price_per_track
FROM album
JOIN track ON album.asin = track.album
GROUP BY title, price
HAVING price / COUNT(song) < 0.5
ORDER BY price_per_track;

/*---------------------------------------------------------------------
|   10. Álbumes ordenados por número de canciones (más primero)
|       Si hay empate, orden alfabético por título
---------------------------------------------------------------------*/
SELECT title, COUNT(song) AS track_count
FROM album
JOIN track ON album.asin = track.album
GROUP BY album.asin, title
ORDER BY track_count DESC, title ASC;

/**********************************************************************
|                                                                     |
|   CONCEPTOS USADOS EN EL TUTORIAL                                   |
|                                                                     |
**********************************************************************/

/*
╔════════════════════════════════════════════════════════════════════╗
║                                                                    ║
║  1. JOIN (INNER JOIN)                                              ║
║     ──────────────────────────────────────────────────────────     ║
║     Combina filas de dos tablas donde existe coincidencia          ║
║     Sintaxis: tablaA JOIN tablaB ON tablaA.col = tablaB.col       ║
║                                                                    ║
║  2. CLAVE PRIMARIA (PRIMARY KEY)                                   ║
║     ──────────────────────────────────────────────────────────     ║
║     Columna que identifica únicamente cada fila (album.asin)       ║
║                                                                    ║
║  3. CLAVE FORÁNEA (FOREIGN KEY)                                    ║
║     ──────────────────────────────────────────────────────────     ║
║     Columna que referencia la clave primaria de otra tabla         ║
║     (track.album → album.asin)                                     ║
║                                                                    ║
║  4. RELACIÓN UNO A MUCHOS                                          ║
║     ──────────────────────────────────────────────────────────     ║
║     Un álbum tiene muchas canciones                                ║
║     Cada canción pertenece a un solo álbum                         ║
║                                                                    ║
║  5. AGREGACIÓN DESPUÉS DE JOIN                                     ║
║     ──────────────────────────────────────────────────────────     ║
║     Podemos usar GROUP BY en el resultado del JOIN                 ║
║     Ej: COUNT(song) por cada álbum                                 ║
║                                                                    ║
║  6. DISTINCT DESPUÉS DE JOIN                                       ║
║     ──────────────────────────────────────────────────────────     ║
║     Para eliminar duplicados cuando JOIN crea repeticiones         ║
║     Ej: canciones en múltiples álbumes (COUNT DISTINCT)           ║
║                                                                    ║
║  7. HAVING CON JOIN                                                ║
║     ──────────────────────────────────────────────────────────     ║
║     Filtra grupos después de agrupar el resultado del JOIN        ║
║     Ej: HAVING COUNT(DISTINCT asin) > 2                            ║
║                                                                    ║
║  8. ORDEN DE EJECUCIÓN CON JOIN                                    ║
║     ──────────────────────────────────────────────────────────     ║
║     1. FROM + JOIN (crea tabla combinada)                         ║
║     2. WHERE (filtra filas combinadas)                            ║
║     3. GROUP BY (agrupa)                                           ║
║     4. HAVING (filtra grupos)                                      ║
║     5. SELECT (selecciona columnas)                                ║
║     6. ORDER BY (ordena resultado)                                 ║
║                                                                    ║
╚════════════════════════════════════════════════════════════════════╝
*/
