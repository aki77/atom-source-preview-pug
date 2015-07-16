path = require 'path'
fs = require 'fs'
JadeProvider = require '../lib/jade-provider'

describe "JadeProvider", ->
  [provider, jadeCode, htmlCode] = []

  beforeEach ->
    provider = new JadeProvider
    jadeCode = fs.readFileSync(path.join(__dirname, 'fixtures', 'sample.jade'), encoding: 'utf8')
    htmlCode = fs.readFileSync(path.join(__dirname, 'fixtures', 'sample.html'), encoding: 'utf8')

  describe "transform", ->
    it "jade -> html", ->
      expect(provider.transform(jadeCode).code.trim()).toEqual(htmlCode.trim())
