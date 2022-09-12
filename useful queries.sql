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

-- MAY NEED DISTINCT (i think it's just multiple artists on single songs)
SELECT 
    tracks.id, artists.name, tracks.name, 
    acousticness, danceability, duration, energy, instrumentalness, key, 
    liveness, loudness, mode, speechiness, tempo, time_signature, valence 
    FROM tracks
JOIN r_track_artist ON tracks.id = r_track_artist.track_id
JOIN artists ON r_track_artist.artist_id = artists.id
JOIN audio_features ON audio_features.id = tracks.audio_feature_id
