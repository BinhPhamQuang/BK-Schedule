import requests
url="https://parsehub.com/api/v2/projects/tnV95-DM1BV8/run";
params={
        "api_key":"t4jcktThdW64",
        "start_value_override":"{\"username\": \"binh.pham.quang\",\"password\":\"quangbinh1340\"}"
    }
r= requests.post(url,data=params)
print(r.json())