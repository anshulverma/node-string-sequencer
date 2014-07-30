class Sequencer
  @SAMPLE = 'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz1234567890'

  constructor: (@sample = Sequencer.SAMPLE) ->

  random: (length) ->
    str = ''
    while str.length < length
      rIndex = Math.floor(do Math.random * 100) % Sequencer.SAMPLE.length
      str += Sequencer.SAMPLE[rIndex]
    str

exports.Sequencer = Sequencer
