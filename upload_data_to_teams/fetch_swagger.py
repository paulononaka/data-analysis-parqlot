#!/usr/bin/env python3
import requests

NOCO_TOKEN = "yg7-wGuo8jZXP6ZPorTsHlXOEUVClcuZPxbnahOw"
url = "https://nocodb-production-ac4d.up.railway.app/api/v2/meta/bases/pb7lpfmycz97c19/swagger.json"

response = requests.get(url, headers={"xc-token": NOCO_TOKEN})
print(response.text)
