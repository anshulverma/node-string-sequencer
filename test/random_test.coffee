describe 'random string test', ->
  describe 'default sample tests', ->
    beforeEach (done) ->
      @seq = new Sequencer
      do done

    it 'can create random string of arbitrary length', ->
      assert.equal @seq.random(10).length, 10,
        'expected string with length 10'
