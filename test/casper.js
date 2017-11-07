const Casper = artifacts.require('./Casper.sol')
const params = [
  50,
  10
]

contract('Casper', (accts) => {
  it('should deploy contract', async () => {
    const cntrct = Casper.new(...params)
    console.log('cntrct', cntrct)
  })
})
