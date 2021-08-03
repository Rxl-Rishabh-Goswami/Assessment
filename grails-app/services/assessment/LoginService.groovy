package assessment

import grails.gorm.transactions.Transactional

@Transactional
class LoginService {

    def serviceMethod() {

    }
    def login(String username, String password){
        User user = User.createCriteria(){
            or{
                eq("email",username)
                eq("username",username)
            }
            and{
                eq("password",password)
            }
        }
    }
}
