[loophole, jade] = []

module.exports =
class JadeProvider
  fromScopeName: 'source.jade'
  toScopeName: 'text.html.basic'

  transform: (code) ->
    jade ?= @unsafe -> require 'jade'

    {
      code: @unsafe -> jade.render(code, pretty: true)
      sourceMap: null
    }

  unsafe: (fn) ->
    loophole ?= require 'loophole'
    {allowUnsafeEval, allowUnsafeNewFunction} = loophole
    allowUnsafeNewFunction -> allowUnsafeEval -> fn()
