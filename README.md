# hubot-healthcheck

healthcheck url

## Getting Started

* Setup your hubot
* Add the script to your hubot.
```
npm install hubot-healthcheck --save
```
* Add `hubot-healthcheck` to `external-scripts.json`, like:
```
["hubot-healthcheck"]
```
* Add the config variables, like:
```
HUBOT_NOTIFICATIONS_ROOM=general@conference.***.xmpp.slack.com
MONGO_URL=mongodb://127.0.0.1:27017/hubot
APP_ROOT_PATH=/var/www/hubot
```

## Healthcheck Url Config
* `${APP_ROOT_PATH}/config/healthcheck.json`

### example
```coffee
{
    "http://example.com/": {
        "watchInterval": 15
    },
    "http://example.com/xxx": {
        "watchInterval": 60
    }
}
```
