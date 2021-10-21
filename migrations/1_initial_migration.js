const Assignment = artifacts.require('Assignment');
const Lido = '0xA5d26F68130c989ef3e063c9bdE33BC50a86629D';
const stETH = '0xA0cA1c13721BAB3371E0609FFBdB6A6B8e155CC0';

module.exports = async function (deployer, network, accounts) {
  await deployer.deploy(Assignment,Lido,stETH);
};
