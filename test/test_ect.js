const ECT = artifacts.require("EthereumColumbusToken.sol");

contract('EthereumColumbusToken', function(accounts) {

    var me = accounts[0]
    var you = accounts[1]

    beforeEach('setup contract for each test', async function() {
        instance = await ECT.new()
        assert.ok(me, 'primary account missing')
        assert.ok(you, 'no secondary account')
    })

    it('should be constructable', async function() {
        assert.equal(await instance.totalSupply.call(), 0)
    })
})
