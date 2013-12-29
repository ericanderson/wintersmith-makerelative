vows = require 'vows'
assert = require 'assert'
wintersmith = require 'wintersmith'

makeRelativePlugin = require '../src/index'

suite = vows.describe 'Plugin'

hasResult = (expected) ->
  context = {
    topic: (makeRelative) ->
      res = @context.name.match(/^call\("(.+)", "(.+)"\)$/)
      makeRelative(res[1], res[2])
  }

  context["returns \"#{expected}\""] = (str) ->
    assert.equal(str, expected)

  context

suite.addBatch({
  'makeRelative': {
    topic: ->
      env = {helpers: {}}
      makeRelativePlugin(env, (->))
      env.helpers.makeRelative

    "is a function": (makeRelative) ->
      assert.isFunction(makeRelative)

    'call("/", "/baz")': hasResult('baz')
    'call("/foo/bar", "/baz")': hasResult('../baz')

    'call("/foo/bar/", "/baz")': hasResult('../../baz')
    'call("/foo/bar/", "/baz/")': hasResult('../../baz/')

    # TODO, this one is less optimal but it fulfills the intent of the project
    'call("/foo/bar/", "/foo/baz")': hasResult('../../foo/baz')
  }
})


suite.export(module)