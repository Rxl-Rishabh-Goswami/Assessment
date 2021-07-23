package assessment

class LoginController {

    def index() { }
    def loginuser() {
        User user = User.findWhere(username: params['username'], password: params['password'])
        if (user) {
            render(view: 'dashboard')
        }
        else{
            redirect(action:'index')

        }
    }
    def register(){
        if(params['password'] == params['confirm']) {
            User user = new User(email: params['email'], username: params['username'], firstName: params['firstName'], lastName: params['lastName'], password: params['password'], active: true, admin: false, photo: [1, 2, 3, 4])
            user.save(flush:true,failOnError:true)
            redirect(action: 'index')


        }
        else{

            redirect(action:'index')
        }
    }
    def forgetPassword(){

    }
}
