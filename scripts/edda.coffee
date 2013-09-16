# Description:
#   Edda provides hubot commands for interfacing with a NetflixOSS
#   Edda instance via API.
#
# Dependencies:
#
##
# Configuration:
#   process.env.HUBOT_EDDA_URL or http://127.0.0.1/
#
# Commands:
#   edda view <aws object> - List objects of type
#   edda url <url> - Get/set the edda base url
#
#

eddaUrl = process.env.HUBOT_EDDA_URL or 'http://127.0.0.1:8080/edda/api/v2'
debug = process.env.HUBOT_EDDA_DEBUG or false

async = require "async"
fs  = require "fs"

log = (event) ->
  if debug
    console.log event

getBaseUrl = ->
  return eddaUrl

getEddaName = (name) ->
  eddaName = switch
    when name == 'ami' || name == 'a' then 'images'
    when name == 'autoscaling' || name == 'as' then 'autoScalingGroups'
    when name == 'loadbalancer' || name == 'lb' then 'loadBalancers'
    when name == 'instance' || name == 'i' then 'instances'
    else name

  return eddaName

eddaGetData = (msg, path, callback) ->
  msg.http(getBaseUrl() + path)
    .get() (err, res, body) ->
      log body
      msg.send JSON.parse(body)

module.exports = (robot) ->
  robot.hear /^(edda|e) (ami|a|instance|i)$/, (msg) ->
    item = getEddaName msg.match[2]
    eddaGet msg, item + '/list.json', item

  robot.hear /^(edda|e) (view|v) (ami|a|instance|i|autoscaling|as|loadbalancer|lb)$/, (msg) ->
    path = "view/#{getEddaName(match[3])}"
    eddaGetData msg, path

