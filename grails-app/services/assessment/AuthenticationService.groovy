package assessment

import grails.gorm.transactions.Transactional

@Transactional
class AuthenticationService {

    def login(String username, String password) {
        User user = User.findWhere(username: username, password: password, active: true)
        if (!user) {
            user = User.findWhere(email: username, password: password, active: true)
        }
        if (user) {
            return user
        }
    }
}
