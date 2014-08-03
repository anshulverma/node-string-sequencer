global.assert = require('chai').assert
isCoverage = process.env['NODE_ENV'] is 'coverage'
srcPath = if isCoverage then '../coverage/src' else '../src'
{Sequencer} = require "#{srcPath}/main"
global.Sequencer = Sequencer
