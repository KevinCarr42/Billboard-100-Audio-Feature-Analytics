SELECT name, genre_id FROM artists
JOIN r_artist_genre ON artists.id = r_artist_genre.artist_id
JOIN genres ON r_artist_genre.genre_id = genres.id
WHERE artists.name LIKE 'zz top'


-- Export to csv for lookup
SELECT id FROM tracks