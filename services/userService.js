const userRepository = require('../repositories/userRepository')

const getAllUsers = async () => {
  return await userRepository.getAllUsers()
}

module.exports = {
  getAllUsers
}
