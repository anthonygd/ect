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

  it('should be able to mint tokens', async function() {
    assert.ok(instance.mint.call(100))

    await instance.mint(1500000000000000000)
    assert.equal(await instance.totalSupply(), 1500000000000000000)
  })

  it('should be able to transfer tokens', async function() {
    await instance.mint(1500000000000000000)

    assert.ok(await instance.transfer.call(you, 100))
    await instance.transfer(you, 100)

    my_bal = await instance.balanceOf(me)

    assert.equal(my_bal.toString(), '1499999999999999900') // CAREFUL- BigNumber
    assert.equal(await instance.balanceOf(you), 100)
  })

  it('should not be able to transfer more than I have', async function() {
    await instance.mint(100)
    assert.equal(await instance.balanceOf(me), 100)

    await instance.transfer(you, 150)

    assert.equal(await instance.balanceOf(me), 100)
    assert.equal(await instance.balanceOf(you), 0)
  })
})
