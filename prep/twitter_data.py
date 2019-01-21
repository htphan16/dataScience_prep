import requests
import json
import tweepy
import pprint as pp

BASE_URL = 'https://api.twitter.com/1.1/'
USER_URL = BASE_URL + 'statuses/user_timeline.json'

ACCESS_TOKEN = '156164443-6eonAgB1ib9hnN4UqI8l3ZV8LMN5iYnhdnKZaA01' 
ACCESS_SECRET = 'HrOWE10xtttr46naF6jTBFmvbE2NkkjzcxMRWL4RFooH5'
CONSUMER_KEY = 'M2HxLgYtPU5tmpAnSgTW8oxAX'
CONSUMER_SECRET = '7kwVKnE9RRHRT64CImwVI7zkCufCtAgyxeYST7dcAXw9sDVLvR'

auth = tweepy.OAuthHandler(CONSUMER_KEY, CONSUMER_SECRET)
auth.set_access_token(ACCESS_TOKEN, ACCESS_SECRET)

api = tweepy.API(auth, wait_on_rate_limit=True, wait_on_rate_limit_notify=True, compression=True)
for status in tweepy.Cursor(api.user_timeline, id="twitter").items(2):
	data = status._json

with open('test_twitter.json', 'w', encoding='utf-8') as outfile:
	json.dump(data, outfile, ensure_ascii=False)

