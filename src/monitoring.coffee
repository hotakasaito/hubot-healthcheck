# -*- mode:coffee; coding:utf-8 -*-
# Description:
#   Monitoring
#

request = require('request')

module.exports = (robot) ->
  # urlでhealthcheckを実行するイベント
  robot.on 'healthcheck:url', (url) ->
    options = {
      url: url
    }
    request.get options, (err, res, body) ->
      msg = "#{url} is #{res.statusCode}"
      robot.logger.info msg
      if err
        robot.logger.error err
        robot.send {room: process.env.HUBOT_NOTIFICATIONS_ROOM}, err
      else if not res.statusCode == 200
        robot.logger.error res.headers
        robot.send {room: process.env.HUBOT_NOTIFICATIONS_ROOM}, msg
