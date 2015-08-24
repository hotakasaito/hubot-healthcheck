# -*- mode:coffee; coding:utf-8 -*-
# coffeelint: disable=max_line_length
#
# Description
#   Scheduler
#
# Author:
#   saito@psycl.one
#

Agenda = require('agenda')
agenda = new Agenda({db:{address: process.env.MONGO_URL}})
fs     = require('fs')
healthcheckConfig = JSON.parse(fs.readFileSync(process.env.APP_ROOT_PATH+'/config/healthcheck.json', 'utf8'))

module.exports = (robot) ->
  agenda.define 'agenda:monitoring', (job, done) ->
    robot.logger.info 'monitoring...'
    robot.emit 'healthcheck:url', job.attrs.data.url
    done()

  for url, opts of healthcheckConfig
    interval = opts.watchInterval ? 60
    robot.logger.info "agenda:monitoring #{url}"
    job = agenda.create('agenda:monitoring', {url: url})
    job.repeatEvery("#{interval} seconds")
    job.save()

  agenda.start()
