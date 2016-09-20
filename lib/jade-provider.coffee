[loophole, jade] = []

module.exports =
class JadeProvider
  fromScopeName: 'source.jade'
  toScopeName: 'text.html.basic'

  transform: (code, {filePath} = {}) ->
    jade ?= @unsafe -> require 'jade'

    options =
      pretty: atom.workspace.getActiveTextEditor().getTabText()
      filename: filePath
      basedir: '/' #atom.project.getPaths()[0]
      require: require

    {
      code: @unsafe -> jade.render(code, options)
      sourceMap: null
    }

  unsafe: (fn) ->
    loophole ?= require 'loophole'
    {allowUnsafeEval, allowUnsafeNewFunction} = loophole
    allowUnsafeNewFunction -> allowUnsafeEval -> fn()
