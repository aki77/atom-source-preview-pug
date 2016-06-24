[loophole, jade, objectAssign] = []

module.exports =
class JadeProvider
  fromScopeName: 'source.jade'
  toScopeName: 'text.html.basic'

  transform: (code, {filePath} = {}) ->
    jade ?= @unsafe -> require 'jade'
    objectAssign ?= @unsafe -> require 'object-assign'

    options =
      pretty: true
      filename: filePath

    if atom.config.get('source-preview-pug.useDefaultLocals')
      locals = atom.config.get('source-preview-pug.defaultLocals');
      if locals
          objectAssign(options, locals);

    {
      code: @unsafe -> jade.render(code, options)
      sourceMap: null
    }

  unsafe: (fn) ->
    loophole ?= require 'loophole'
    {allowUnsafeEval, allowUnsafeNewFunction} = loophole
    allowUnsafeNewFunction -> allowUnsafeEval -> fn()
