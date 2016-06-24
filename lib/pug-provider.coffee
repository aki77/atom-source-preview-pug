[loophole, pug, objectAssign] = []

module.exports =
class PugProvider
  fromScopeName: 'source.pug'
  toScopeName: 'text.html.basic'

  transform: (code, {filePath} = {}) ->
    pug ?= @unsafe -> require 'pug'
    objectAssign ?= @unsafe -> require 'object-assign'

    options =
      pretty: true
      filename: filePath

    if atom.config.get('source-preview-pug.useDefaultLocals')
      locals = atom.config.get('source-preview-pug.defaultLocals');
      if locals
        objectAssign(options, locals);

    {
      code: @unsafe -> pug.render(code, options)
      sourceMap: null
    }

  unsafe: (fn) ->
    loophole ?= require 'loophole'
    {allowUnsafeEval, allowUnsafeNewFunction} = loophole
    allowUnsafeNewFunction -> allowUnsafeEval -> fn()
