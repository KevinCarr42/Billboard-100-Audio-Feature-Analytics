SELECT name, genre_id FROM artists
JOIN r_artist_genre ON artists.id = r_artist_genre.artist_id
JOIN genres ON r_artist_genre.genre_id = genres.id
WHERE artists.name LIKE 'zz top'


-- Export to csv for lookup
SELECT id FROM tracks


-- very slow, even if you limit tracks
SELECT * FROM tracks
JOIN r_track_artist ON tracks.id = r_track_artist.track_id
JOIN artists ON r_track_artist.artist_id = artists.id
JOIN audio_features ON audio_features.id = tracks.audio_feature_id

-- alternative with only desired columns
SELECT 
    tracks.id, artists.name, tracks.name, 
    acousticness, danceability, duration, energy, instrumentalness, key, 
    liveness, loudness, mode, speechiness, tempo, time_signature, valence 
    FROM tracks
JOIN r_track_artist ON tracks.id = r_track_artist.track_id
JOIN artists ON r_track_artist.artist_id = artists.id
JOIN audio_features ON audio_features.id = tracks.audio_feature_id


--  release dates
SELECT tracks.id AS track_id, release_date FROM tracks
JOIN r_albums_tracks ON tracks.id = r_albums_tracks.track_id
JOIN albums ON r_albums_tracks.album_id = albums.id


-- OUTDATED: this is just by artist, just based on linking table
-- better results from merging artist with song

	-- how often are genres used to describe bands?
	SELECT genre_id, COUNT(genre_id) as counts FROM r_artist_genre
	GROUP BY genre_id
	ORDER BY counts DESC


	-- only return most commonly used genre
	SELECT artists.id AS artist_id, name AS artist, genre_id AS genre, counts FROM artists 
	JOIN r_artist_genre ON artists.id = r_artist_genre.artist_id
		JOIN
		(SELECT genre_id, COUNT(genre_id) AS counts FROM r_artist_genre
		GROUP BY genre_id
		ORDER BY counts DESC) AS genre_counts
	ON r_artist_genre.genre_id = genre_counts.genre_id
	GROUP BY artist_id
	ORDER BY name


-- artist track cross table
SELECT * FROM r_track_artist


-- track genres from SQL
SELECT tracks.id AS track_id, name AS track_name, r_track_artist.artist_id AS artist_id, genre_id  FROM tracks
JOIN r_track_artist ON tracks.id = r_track_artist.track_id
JOIN r_artist_genre ON r_track_artist.artist_id = r_artist_genre.artist_id


-- popularity by track and genre
SELECT tracks.id, r_artist_genre.genre_id, tracks.popularity FROM tracks
JOIN r_track_artist ON tracks.id = r_track_artist.track_id
JOIN r_artist_genre ON r_track_artist.artist_id = r_artist_genre.artist_id


-- popularity by track
SELECT id, popularity FROM tracks


--  release dates and genres
SELECT tracks.id AS id, release_date, genre_id as genre FROM tracks
JOIN r_albums_tracks ON tracks.id = r_albums_tracks.track_id
JOIN albums ON r_albums_tracks.album_id = albums.id
JOIN r_track_artist ON tracks.id = r_track_artist.track_id
JOIN r_artist_genre ON r_track_artist.artist_id = r_artist_genre.artist_id