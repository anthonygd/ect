require('babel-register')
require('babel-polyfill')

module.exports = {
	networks: {
		develop: {
			host: "127.0.0.1",
			port: 9545,
			network_id: "4447",
			gas: 6712390
		},
		ganache: {
			host: "127.0.0.1",
			port: 7545,
			network_id: "5777",
			gas: 8000000
		}
	}
};
