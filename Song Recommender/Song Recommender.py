#!/usr/bin/env python
# coding: utf-8

# In[1]:


#import pandas as pd
import random
import pickle
#from sklearn.preprocessing import MinMaxScaler
#from sklearn.cluster import KMeans
#import spotipy
from spotipy.oauth2 import SpotifyClientCredentials


# ### Connecting to Spotify:

# In[2]:


secrets_file = open("secrets.txt","r")

string = secrets_file.read()

secrets_dict={}

for line in string.split('\n'):
    if len(line) > 0:
        secrets_dict[line.split(':')[0]]=line.split(':')[1].strip()
        
sp = spotipy.Spotify(auth_manager=SpotifyClientCredentials(client_id=secrets_dict['cid'],
                                                           client_secret=secrets_dict['csecret']))


# ### Unpickling my Model and Scaler:

# In[3]:


kmeans = pickle.load(open('kmeans.pkl','rb'))
scaler = pickle.load(open('minmax.pkl','rb'))


# ### Loading the Data needed:

# In[4]:


top100 = pd.read_csv('songs.csv')
alternative = pd.read_csv('songs_with_feats_and_clusters.csv')


# In[5]:


display(top100.head(3))
display(alternative.head(3))


# ### Getting a sing to recommend on:

# In[36]:


input_song = [input('Enter your favorite songs\n> ').strip()]


# ### Recommending:

# In[37]:


import random

song_lst = top100['song'].tolist()
favorites = top100[top100.song.isin(input_song)]
fav_lst = favorites.song.tolist()
track_feats = pd.DataFrame()
# print(fav_lst)
# print(favorites)


if not not fav_lst:
#     print(not not fav_lst)
    print(random.choice(song_lst))
if not fav_lst:
#         track_feats = pd.DataFrame()
    for a in input_song:
        track = sp.search(q=a)
        track_uri = [track['tracks']['items'][0]['uri']]
    #     print(v)
    #     print(track_uri)
    for b in track_uri:
        track_feats = track_feats.append((sp.audio_features(b)),ignore_index=True)
        track_feats = track_feats.select_dtypes(include='number')
        track_feats = pd.DataFrame(scaler.transform(track_feats), columns=track_feats.columns)
        track_cluster = kmeans.predict(track_feats).tolist()
    #     display(track_feats)
    #     display(track_cluster)
    for c in track_cluster:
        rec = alternative[(alternative['cluster'] == c)].sample()
        display(rec[['song','artist']])